import { Component } from '@angular/core';
import { AuthenticationService } from './service/authentication.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'ltw';
  check: boolean = true;
  constructor(private authService: AuthenticationService){
    this.authService.checkLogin();
    this.check = this.authService.flag;
  }
}
