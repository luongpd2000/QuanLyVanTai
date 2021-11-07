import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { TaiXeComponent } from './module/tai-xe/tai-xe.component';
import { XeKhachComponent } from './module/xe-khach/xe-khach.component';
import { ModuleModule } from './module/module.module';

@NgModule({
  declarations: [
    AppComponent,
    TaiXeComponent,
    XeKhachComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ModuleModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
