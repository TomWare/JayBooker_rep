//Commentaire pour pouvoir push le app.module, A supprimer
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DashboardComponent } from './dashboard/dashboard.component';

import { HttpClientModule } from '@angular/common/http';

import { LoginComponent } from './login/login.component';
import { BookingsComponent } from './bookings/bookings.component';
import { SingleBookingComponent } from './single-booking/single-booking.component';
import { ShipsComponent } from './ships/ships.component';
import { SingleShipComponent } from './single-ship/single-ship.component';
import { AccomodationsComponent } from './accomodations/accomodations.component';
import { SingleAccomodationComponent } from './single-accomodation/single-accomodation.component';
import { SingleSeasonComponent } from './single-season/single-season.component';
import { SeasonsComponent } from './seasons/seasons.component';
import { DeparturesComponent } from './departures/departures.component';
import { SingleDepartureComponent } from './single-departure/single-departure.component';
import { InvoicesComponent } from './invoices/invoices.component';
import { SingleInvoiceComponent } from './single-invoice/single-invoice.component';
import { ProductsComponent } from './products/products.component';
import { SingleProductComponent } from './single-product/single-product.component';
import { GuestsComponent } from './guests/guests.component';
import { SingleGuestComponent } from './single-guest/single-guest.component';
import { RatesComponent } from './rates/rates.component';
import { SingleRateComponent } from './single-rate/single-rate.component';
import { UsersComponent } from './users/users.component';
import { SingleUserComponent } from './single-user/single-user.component';
import { CategoriesComponent } from './categories/categories.component';
import { SingleCategoryComponent } from './single-category/single-category.component';
import { LogbookComponent } from './logbook/logbook.component';
import { SuppliersComponent } from './suppliers/suppliers.component';
import { SingleSupplierComponent } from './single-supplier/single-supplier.component';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { PhoneMaskDirective } from './masks/phone-mask.directive';
import { EncrDecrService } from './encr-decr.service';





@NgModule({
  declarations: [
    AppComponent,
    DashboardComponent,
    LoginComponent,
    BookingsComponent,
    SingleBookingComponent,
    ShipsComponent,
    SingleShipComponent,
    AccomodationsComponent,
    SingleAccomodationComponent,
    SingleSeasonComponent,
    SeasonsComponent,
    DeparturesComponent,
    SingleDepartureComponent,
    InvoicesComponent,
    SingleInvoiceComponent,
    ProductsComponent,
    SingleProductComponent,
    GuestsComponent,
    SingleGuestComponent,
    RatesComponent,
    SingleRateComponent,
    UsersComponent,
    SingleUserComponent,
    CategoriesComponent,
    SingleCategoryComponent,
    LogbookComponent,
    SuppliersComponent,
    SingleSupplierComponent,
    PhoneMaskDirective
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,

    FormsModule,
    ReactiveFormsModule,

    FormsModule

  ],
  providers: [EncrDecrService],
  bootstrap: [AppComponent]
})
export class AppModule { }
