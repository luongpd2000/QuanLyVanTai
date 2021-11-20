import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Route } from '../data/route';

@Injectable({
  providedIn: 'root'
})
export class RouteService {

  private baseUrl = `${environment.baseUrl}/route`;

  constructor(private httpClient: HttpClient) { }


  getAll(){
    const routeUrl = `${this.baseUrl}/findAll`;
    return this.httpClient.get<Route[]>(routeUrl);
  }


}
