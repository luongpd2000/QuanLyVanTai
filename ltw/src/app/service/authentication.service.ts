import { Location } from '@angular/common';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class AuthenticationService {
  private baseUrl = environment.baseUrl;

  private authenUrl = environment.authenUrl;

  flag: boolean = false;

  path: any;

  constructor(
    private httpClient: HttpClient,
    private router: Router,
    private _cookieService: CookieService,
    private location: Location
  ) {}

  getJwtToken(account: any) {
    const authenticateUrl = `${this.authenUrl}/authenticate`;
    return this.httpClient.post<any>(authenticateUrl, account);
  }

  public async checkLogin() {
    // console.log(this._cookieService.get('Authorization'));
    const headers = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        Authorization: this._cookieService.get('Authorization'),
      }),
    };

    const checkLoginUrl = `${this.authenUrl}/checkLogin`;
    var data: any;
    try {
      data = await this.httpClient.get<any>(checkLoginUrl, headers).toPromise();
    } catch (error) {
      this.flag = false;
      // console.log(this.flag)
      return this.flag;
    }
    // .subscribe(
    //   (data) => {
    //     console.log(data);
    //     this.flag = true;
    //   },
    //   (error) => {
    //     console.log(error);
    //     this.flag = false;
    //   }
    // );
    // console.log(data.status)
    if (data.status === 'loggedIn') {
      this.flag = true;
      // location.reload();
    } else this.flag = false;
    // console.log(this.flag)
    return this.flag;
  }

  logout() {
    this.flag = false;
    // Remove the token from the cookie.
    this._cookieService.delete('Authorization');
    // this.router.navigate(['/login']);
    location.replace('/login');
  }
}
