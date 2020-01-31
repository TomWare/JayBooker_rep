import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { MustMatch } from '../models/MustMatch';
import { DataService } from '../data.service';
import { Router } from '@angular/router';
import { EncrDecrService } from '../encr-decr.service';

@Component({
  selector: 'app-single-user',
  templateUrl: './single-user.component.html',
  styleUrls: ['./single-user.component.scss']
})
export class SingleUserComponent implements OnInit {
  registerForm: FormGroup;
  submitted = false;  
  newUser = new User();
  users: Array<User>;


  constructor(private formBuilder: FormBuilder, private data: DataService, private router: Router, private EncrDecr: EncrDecrService) {
    this.data.getAll('users').subscribe((res: Array<User>) => {
      this.users = res;
      console.log(this.users);
    })
  }

  ngOnInit() {
    this.registerForm = this.formBuilder.group({
      username: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      address: [],
      city: [],
      postalCode: ['', Validators.pattern("^(?!.*[DFIOQU])[A-VXY][0-9][A-Z] ?[0-9][A-Z][0-9]$")],
      description: [],
      phone: [],
      role: ['', Validators.required],
      country: ['', Validators.required],
      userIsActive: []
    }, {
        validator: MustMatch('password', 'confirmPassword')
      });
    this.registerForm.get('role').setValue('Réception');
    this.registerForm.get('country').setValue('Canada');
    this.registerForm.get('userIsActive').setValue('true');
  }

  // convenience getter for easy access to form fields
  get f() { return this.registerForm.controls; }

  onSubmit() {
    this.submitted = true;
   // console.log("submitted = true");
    // stop here if form is invalid       

    if (this.registerForm.invalid) {
      //console.log("invalid = true");
      alert('Veuillez remplir tous les champs obligatoires (*)');
      return;
    }
       
   
    this.newUser.UserName = this.registerForm.value.username;
    this.newUser.UserPasswordHash = this.EncrDecr.set('123456$#@$^@1ERF', this.registerForm.value.password);
    this.newUser.UserEmail = this.registerForm.value.email;
    this.newUser.UserFirstName = this.registerForm.value.firstName
    this.newUser.UserLastName = this.registerForm.value.lastName;
    this.newUser.UserAddress = this.registerForm.value.address;
    this.newUser.UserCity = this.registerForm.value.city;
    this.newUser.UserCountry = this.registerForm.value.country;
    this.newUser.UserPostalCode = this.registerForm.value.postalCode;
    this.newUser.UserPhone = this.registerForm.value.phone;
    this.newUser.UserDescription = this.registerForm.value.description;
    this.newUser.UserRole = this.registerForm.value.role;
   // this.newUser.UserCreatedOn = today.getFullYear() + '-' + (today.getMonth() >= 10 ? (today.getMonth() + 1) : "0" + (today.getMonth() + 1)) + '-' + (today.getDate() >= 10 ? (today.getDate()) : "0" + (today.getDate()));
    this.newUser.UserIsActive = this.registerForm.value.userIsActive;
    //var passwordClair = this.EncrDecr.get('123456$#@$^@1ERF', 'TgLk0zegCM5AfEY3q5Ii/w==');
    //console.log(this.newUser);
    //console.log(passwordClair);
    // display form values on success
    this.data.put('users', this.newUser).subscribe((res: User) => {
      alert('Utilisateur ajouté!\n\n DERNIÈRE CHANCE DE PRENDRE LE MOT DE PASSE EN NOTE!\n\n' + JSON.stringify(this.registerForm.value, null, 4));
      this.router.navigate(['utilisateurs']);      
    })
  }
  onReset() {
    this.submitted = false;
    this.registerForm.reset();
  }


  validateZip() {
    this.registerForm.removeControl("postalCode");
    if (this.registerForm.get('country').value == "Canada") {
      this.registerForm.addControl("postalCode", new FormControl('', Validators.pattern("^(?!.*[DFIOQU])[A-VXY][0-9][A-Z] ?[0-9][A-Z][0-9]$")));
    }
    else {
      this.registerForm.addControl("postalCode", new FormControl('', Validators.pattern("^[0-9]{5}(?:-[0-9]{4})?$")));
    }
  }
  

}

export class User {
  UserID: number
  UserName: string
  UserPasswordHash: string
  UserEmail: string
  UserFirstName: string
  UserLastName: string
  UserAddress: string
  UserCity: string
  UserCountry: string
  UserPostalCode: string
  UserPhone: string
  UserDescription: string
  UserRole: string
  UserCreatedOn: Date
  UserIsActive: boolean
}



