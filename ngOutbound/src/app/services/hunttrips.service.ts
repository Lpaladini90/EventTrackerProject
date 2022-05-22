import { catchError, throwError } from 'rxjs';
import { Hunttrip } from './../models/hunttrip';
import { DatePipe } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { AuthService } from './auth.service';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class HunttripsService {

  constructor(private http : HttpClient, private datePipe : DatePipe,private auth : AuthService) { }

  private baseUrl = environment.baseUrl + 'api/outbound/hunttrips'


  getHttpOptions() {
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

    //--------------  SHOW ALL HUNTS ----------------
  public index(){
    return this.http.get<Hunttrip[]>(this.baseUrl,this.getHttpOptions())
    .pipe(
      catchError((err:any)=>{
        return throwError("index erroe- KABOOM!")
      })
    )}


    //--------------   CREATE HUNTS ----------------

  public create(newHunt : Hunttrip){
    return this.http.post<Hunttrip[]>(this.baseUrl, newHunt,this.getHttpOptions())
    .pipe(
      catchError((err: any)=>{
        console.log(err);
        return throwError('Create error - KABOOM!');

      })
    )
  }

  public update(updateHunt : Hunttrip, id : number){
    return this.http.put<Hunttrip>(this.baseUrl + "/" + id, updateHunt,this.getHttpOptions())
    .pipe(

      catchError((err : any)=>{
        console.log(err);
        return throwError("KABOOM");

      })
    )

  }

  public destory(id: number){

    return this.http.delete<Hunttrip>(this.baseUrl + "/" + id,this.getHttpOptions())
    .pipe(

      catchError((err : any)=>{
        console.log(err);
        return throwError("KABOOM");

      })
    )
  }

  public show(id:number){
    return this.http.get<Hunttrip>(this.baseUrl + "/" + id,this.getHttpOptions())
    .pipe(
      catchError((err:any)=>{
        return throwError('Check this- KABOOM!')
      })
    )
  }

}
