import { Component, OnInit } from '@angular/core';
import { User } from '../single-user/single-user.component';
import { DataService } from '../data.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss']
})
export class UsersComponent implements OnInit {
  users: Array<User>;
  constructor(private data: DataService, private router:Router) {
    this.data.getAll('users').subscribe((res: Array<User>) => {
      this.users = res;
      //console.log(this.users);
    })
  }

  ngOnInit() {
  }

  

}
