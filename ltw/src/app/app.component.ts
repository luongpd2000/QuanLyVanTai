import { Location } from '@angular/common';
import { Component } from '@angular/core';
import { AuthenticationService } from './service/authentication.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'ltw';
  check: boolean = false;
  constructor(private authService: AuthenticationService,
    private location: Location){

    this.authService.checkLogin();
    this.check = this.authService.flag;
    this.getPath();
  }

  async getPath(){
    this.authService.path = await this.location.path();
  }

  logOut(){
    this.authService.logout();
  }
}
