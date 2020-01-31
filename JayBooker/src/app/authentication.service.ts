import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { User } from './single-user/single-user.component';
import { Router } from '@angular/router';



@Injectable({ providedIn: 'root' })
export class AuthenticationService {
  private currentUserSubject: BehaviorSubject<User>;
  public currentUser: Observable<User>;

  constructor(private http: HttpClient, private router: Router) {
    this.currentUserSubject = new BehaviorSubject<User>(JSON.parse(localStorage.getItem('currentUser')));
    this.currentUser = this.currentUserSubject.asObservable();
  }

  public get currentUserValue(): User {
    return this.currentUserSubject.value;
  }

  login(model: User) {
    //this.http.post('localhost', model).subscribe((res: boolean) => {
    //  if (res) {
    //    localStorage.setItem('currentUser', JSON.stringify(model));
    //    this.currentUserSubject.next(model);
    //    this.router.navigate(["tableau-de-bord"]);
    //  }
    //  else {
    //    console.log("wrong login")
    //  }
    //})
    if (model.UserName == "Bob" && model.UserPasswordHash == 'BobBob') {
      localStorage.setItem('currentUser', JSON.stringify(model));
      this.currentUserSubject.next(model);
      this.router.navigate(['']);
    }
    else {
      console.log("wrong login")
    }
  }

  logout() {
    // remove user from local storage and set current user to null
    localStorage.removeItem('currentUser');
    this.currentUserSubject.next(null);
  }
}
