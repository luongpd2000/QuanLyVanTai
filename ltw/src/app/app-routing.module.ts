import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { AuthGuard } from './guard/auth.guard';
import { LoginComponent } from './login/login.component';
import { CoachTurnComponent } from './module/coach-turn/coach-turn.component';
import { CoachComponent } from './module/coach/coach.component';
import { DriverComponent } from './module/driver/driver.component';
import { RouteComponent } from './module/route/route.component';

const routes: Routes = [
  {path: '',component: AppComponent, canActivate: [AuthGuard]},
  {path: 'home',component: AppComponent, canActivate: [AuthGuard]},
  {path: 'login',component: LoginComponent},
  {path: 'route' , component: RouteComponent, canActivate: [AuthGuard]},
  {path: 'driver' , component: DriverComponent, canActivate: [AuthGuard]},
  {path: 'coach' , component: CoachComponent, canActivate: [AuthGuard]},
  {path: 'coach-turm' , component: CoachTurnComponent, canActivate: [AuthGuard]},

  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
