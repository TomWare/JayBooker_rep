import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';
import { DataService } from '../data.service';
import { Router } from '@angular/router';
import { AuthenticationService } from '../authentication.service';
import { User } from '../single-user/single-user.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  loginModel: User = new User();
  constructor(private auth:AuthenticationService,private data: DataService, private router:Router) { }

  ngOnInit() {
  }

  login() {
   this.auth.login(this.loginModel)
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

