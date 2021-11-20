import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {APP_BASE_HREF} from '@angular/common';
import { RouteComponent } from './module/route/route.component';
import { DriverComponent } from './module/driver/driver.component';
import { CoachComponent } from './module/coach/coach.component';
import { CoachTurnComponent } from './module/coach-turn/coach-turn.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from 'src/share/material.module';
import { HttpClientModule } from '@angular/common/http';
import { ConfirmDialogComponent } from './module/confirm-dialog/confirm-dialog.component';

@NgModule({
  declarations: [
    AppComponent,
    RouteComponent,
    DriverComponent,
    CoachComponent,
    CoachTurnComponent,
    ConfirmDialogComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    HttpClientModule
  ],
  providers: [
    {provide: APP_BASE_HREF, useValue: '/'}
  ],
  entryComponents: [ConfirmDialogComponent],
  bootstrap: [AppComponent]
})
export class AppModule { }
