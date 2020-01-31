import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';
import { LoginModel } from '../models/LoginModel';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  loginModel: LoginModel = new LoginModel();
  constructor(public app:AppComponent) { }

  ngOnInit() {
  }

  login() {
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

