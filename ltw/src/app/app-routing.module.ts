import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CoachTurnComponent } from './module/coach-turn/coach-turn.component';
import { CoachComponent } from './module/coach/coach.component';
import { DriverComponent } from './module/driver/driver.component';
import { RouteComponent } from './module/route/route.component';

const routes: Routes = [
  {path: '',redirectTo: '/',pathMatch: 'full'},
  {path: 'route' , component: RouteComponent},
  {path: 'driver' , component: DriverComponent},
  {path: 'coach' , component: CoachComponent},
  {path: 'coach-turm' , component: CoachTurnComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
