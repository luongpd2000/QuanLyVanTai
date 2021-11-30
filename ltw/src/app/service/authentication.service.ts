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

  flag : boolean = false;

  path: any;

  constructor(private httpClient: HttpClient,
    private router : Router,
    private _cookieService: CookieService) {}

  getJwtToken(account: any) {
    const authenticateUrl = `${this.baseUrl}/authenticate`;
    return this.httpClient.post<any>(authenticateUrl, account);
  }

  public async checkLogin() {
    const headers = {
      headers: new HttpHeaders(
        { 'Content-Type': 'application/json',
          'Authorization': this._cookieService.get('Authorization')
        })
    };
    const checkLoginUrl = `${this.baseUrl}/checkLogin`;
    await this.httpClient.get<any>(checkLoginUrl).subscribe(
      data=>{
        this.flag = true;
      },
      error =>{
        this.flag =  false;
      }
    )
    return this.flag;
  }

  logout()
  {
    this.flag = false;
    // Remove the token from the cookie.
    this._cookieService.delete('Authorization');
    this.router.navigate(['/login']);
  }
}
