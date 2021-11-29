import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
// import { get } from 'http';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  logIn!: FormGroup;

  constructor() { }

  ngOnInit(): void {
    this.logIn = new FormGroup({
      username: new FormControl('',[
        Validators.maxLength(50)
      ]),
      password: new FormControl('',[
        Validators.minLength(8),
        Validators.maxLength(50),
        Validators.pattern('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&].{8,}')
      ])
    })

  }




login(){


}


get username() { return this.logIn.get('username');}
get password() { return this.logIn.get('password');}

}

