import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';
import { LoginModel } from '../models/LoginModel';
import { DataService } from '../data.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  loginModel: LoginModel = new LoginModel();
  constructor(public app:AppComponent, private data: DataService, private router:Router) { }

  ngOnInit() {
  }

  login() {
    this.app.logged = true;
    this.router.navigate(['tableau-de-bord']);
    //console.log(this.loginModel);
    //this.data.post('logins',this.loginModel).subscribe((res: boolean) => {
    //  if (res) {
    //    this.app.logged = true;
    //    localStorage.setItem('logged',"")
    //    //redirect vers page
    //  }
    //  else {
    //    //mauvais login
    //    //toast wrong login
    //  }
    //})
  }

}

