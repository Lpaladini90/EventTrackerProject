import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {


  constructor(private auth : AuthService, private router : Router) { }

  ngOnInit(): void {
  }
  logout(): void {
    console.log('logging out.');

    this.auth.logout();
    this.router.navigateByUrl("/home")
  }


  loggedIn(): boolean {
    return this.auth.checkLogin();
  }

}
