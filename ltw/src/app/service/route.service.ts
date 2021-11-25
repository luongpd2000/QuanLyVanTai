import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { RequestParam } from '../data/request-param';
import { Route } from '../data/route';
import { ApiUrlUtil } from '../util/api-url.util';
import { ParamUtil } from '../util/param.util';

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

  getRouteById(id: number){
    const routeUrl = `${this.baseUrl}/findById/${id}`;
    return this.httpClient.get<Route>(routeUrl);
  }

  createRoute(route: Route){
    const routeUrl = `${this.baseUrl}/create`;
    return this.httpClient.post<Route>(routeUrl,route);
  }

  searchRoute(param: any){
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const routeUrl = ApiUrlUtil.buildQueryString(this.baseUrl+ '/searchRoute', params);
    console.log(routeUrl);
    // const routeUrl = `${this.baseUrl}/searchRoute?${param}`;
    return this.httpClient.get<Route[]>(routeUrl);
  }

  deleteRoute(id: number){
    const routeUrl = `${this.baseUrl}/deleteById/${id}`;
    return this.httpClient.delete<any>(routeUrl);
  }

  update(route: Route){
    const routeUrl = `${this.baseUrl}/update`;
    return this.httpClient.put<any>(routeUrl,route);
  }


}
