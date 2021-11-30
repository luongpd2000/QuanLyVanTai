import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { AuthenticationService } from '../service/authentication.service';
// import { get } from 'http';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  logIn!: FormGroup;

  constructor(private authService: AuthenticationService,
    private router : Router,
    private _cookieService: CookieService) {}

  ngOnInit(): void {
    this.logIn = new FormGroup({
      username: new FormControl('', [
        Validators.required,
        // Validators.maxLength(50)
      ]),
      password: new FormControl('', [
        Validators.required,
        // Validators.minLength(8),
        // Validators.maxLength(50),
        // Validators.pattern('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&].{8,}')
      ]),
    });
  }

  login() {
    const u = this.logIn.controls['username'].value;
    const p = this.logIn.controls['password'].value;

    const account ={
      username: u,
      password: p
    }

    console.log(account)

    this.authService.getJwtToken(account).subscribe(
      data =>{
      console.log(data);
      this._cookieService.set("Authorization",data.token)
      this.router.navigate(["/home"]);
    }, error =>{
      alert("Login fail: check username and password");
      console.log(error);
  })
  }

  get username() {
    return this.logIn.get('username');
  }
  get password() {
    return this.logIn.get('password');
  }
}
