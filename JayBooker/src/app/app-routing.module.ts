import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AccomodationsComponent } from './accomodations/accomodations.component';
import { SingleAccomodationComponent } from './single-accomodation/single-accomodation.component';
import { BookingsComponent } from './bookings/bookings.component';
import { SingleBookingComponent } from './single-booking/single-booking.component';
import { CategoriesComponent } from './categories/categories.component';
import { SingleCategoryComponent } from './single-category/single-category.component';
import { DeparturesComponent } from './departures/departures.component';
import { SingleDepartureComponent } from './single-departure/single-departure.component';
import { GuestsComponent } from './guests/guests.component';
import { SingleGuestComponent } from './single-guest/single-guest.component';
import { InvoicesComponent } from './invoices/invoices.component';
import { SingleInvoiceComponent } from './single-invoice/single-invoice.component';
import { LogbookComponent } from './logbook/logbook.component';
import { LoginComponent } from './login/login.component';
import { ProductsComponent } from './products/products.component';
import { SingleProductComponent } from './single-product/single-product.component';
import { SeasonsComponent } from './seasons/seasons.component';
import { ShipsComponent } from './ships/ships.component';
import { SingleShipComponent } from './single-ship/single-ship.component';
import { UsersComponent } from './users/users.component';
import { SingleUserComponent } from './single-user/single-user.component';
import { SingleRateComponent } from './single-rate/single-rate.component';
import { SuppliersComponent } from './suppliers/suppliers.component';
import { SingleSupplierComponent } from './single-supplier/single-supplier.component';
import { RatesComponent } from './rates/rates.component';
import { SingleSeasonComponent } from './single-season/single-season.component';


const routes: Routes = [
  {
    path: "",
    component: DashboardComponent
  },
  {
    path: "tableau-de-bord",
    component: DashboardComponent
  },
  {
    path: "hébergement",
    component: AccomodationsComponent
  },
  {
    path: "hébergement/:id",
    component: SingleAccomodationComponent
  },
  {
    path: "hébergement/create",
    component: SingleAccomodationComponent
  },
  {
    path: "réservations",
    component: BookingsComponent
  },
  {
    path: "réservations/:id",
    component: SingleBookingComponent
  },
  {
    path: "réservations/create",
    component: SingleBookingComponent
  },
  {
    path: "catgories",
    component: CategoriesComponent
  },
  {
    path: "categories/:type/:id",
    component: SingleCategoryComponent
  },
  {
    path: "categories/:type/create",
    component: SingleCategoryComponent
  },
  {
    path: "départs",
    component: DeparturesComponent
  },
  {
    path: "départs/:id",
    component: SingleDepartureComponent
  },
  {
    path: "départs/create",
    component: SingleDepartureComponent
  },  
  {
    path: "clients",
    component: GuestsComponent
  },
  {
    path: "clients/:id",
    component: SingleGuestComponent
  },
  {
    path: "clients/create",
    component: SingleGuestComponent
  },
  {
    path: "agences",
    component: SuppliersComponent
  },
  {
    path: "agences/:id",
    component: SingleSupplierComponent
  },
  {
    path: "agences/create",
    component: SingleSupplierComponent
  },
  {
    path: "factures",
    component: InvoicesComponent
  },
  {
    path: "factures/:id",
    component: SingleInvoiceComponent
  },
  {
    path: "factures/create",
    component: SingleInvoiceComponent
  },
  {
    path: "logbook",
    component: LogbookComponent
  },
  {
    path: "login",
    component: LoginComponent
  },
  {
    path: "produits",
    component: ProductsComponent
  },
  {
    path: "produits/:id",
    component: SingleProductComponent
  },
  {
    path: "produits/create",
    component: SingleProductComponent
  },
  {
    path: "tarifs",
    component: RatesComponent
  },
  {
    path: "tarifs/:type/:id",
    component: SingleRateComponent
  },
  {
    path: "tarifs/:type/create",
    component: SingleRateComponent
  },
  {
    path: "saisons",
    component: SeasonsComponent
  },
  {
    path: "saisons/:id",
    component: SingleSeasonComponent
  },
  {
    path: "saisons/create",
    component: SingleSeasonComponent
  },
  {
    path: "navires",
    component: ShipsComponent
  },
  {
    path: "navires/:id",
    component: SingleShipComponent
  },
  {
    path: "navires/create",
    component: SingleShipComponent
  },
  {
    path: "utilisateurs",
    component: UsersComponent
  },
  {
    path: "utilisateurs/:id",
    component: SingleUserComponent
  },
  {
    path: "utilisateurs/create",
    component: SingleUserComponent
  }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
