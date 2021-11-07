import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TaiXeComponent } from './module/tai-xe/tai-xe.component';
import { XeKhachComponent } from './module/xe-khach/xe-khach.component';

const routes: Routes = [
  {path: '',redirectTo: '/',pathMatch: 'full'},
  {path:'tai-xe',component: TaiXeComponent},
  {path:'xe-khach',component: XeKhachComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {



 }
