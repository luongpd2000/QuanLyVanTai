import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class AuthenticationService {
  private baseUrl = environment.baseUrl;

  flag : boolean = false;

  constructor(private httpClient: HttpClient) {}

  getJwtToken(account: any) {
    const authenticateUrl = `${this.baseUrl}/authenticate`;
    return this.httpClient.post<any>(authenticateUrl, account);
  }

  public async checkLogin() {
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
}
