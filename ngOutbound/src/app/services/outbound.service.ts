
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class OutboundService {

  private baseUrl = environment.baseUrl + 'api/outbound/'



  constructor(private http: HttpClient) { }
}
