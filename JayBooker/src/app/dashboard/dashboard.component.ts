import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';


@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  DateToShow: number
  Ships: Array<Ship>
  Departs: Array<Departure>
  Bookings: Array<Booking>
  NewDate: string
  date: string
  AdultsCount: number
  ChildrenCount: number
  StudentsCount: number
  constructor(public data: DataService) {
    var today = new Date();
    this.NewDate = today.getFullYear() + '-' + (today.getMonth() >= 10 ? (today.getMonth() + 1) : "0" + (today.getMonth() + 1)) + '-' + (today.getDate() >= 10 ? (today.getDate()) : "0" + (today.getDate()));
    console.log(this.NewDate)
   
    this.data.getShips().subscribe((res: Array<Ship>) => {
      this.Ships = res;
     console.log(this.Ships)
    })




    this.LoadDepartures()


    //this.data.getBookings().subscribe((res: Array<Booking>) => {
    //  this.Bookings = res;
    //  console.log(this.Bookings)
    //})
  }

  ngOnInit() {
  }

  //LoadBookingsByDepartures() {

  //  this.Departs.forEach(function (depart) {
  //    this.data.getBookingsByDeparture(depart.DepartureID).subscribe((res: Array<Booking>) => {
  //      depart.BookingList = res

  //      for (var i = 0; i < depart.BookingList.length; i++) {
  //        depart.AdultsCount = depart.BookingList[i].BookingAdultsCount + depart.BookingList[i].BookingFreeAdultsCount
  //        depart.ChildrenCount = depart.BookingList[i].BookingChildrenCount + depart.BookingList[i].BookingFreeChildrenCount
  //        depart.StudentsCount = depart.BookingList[i].BookingStudentsCount
  //        depart.FreePassCount = depart.BookingList[i].BookingFreeAdultsCount + depart.BookingList[i].BookingFreeChildrenCount
  //      }
  //    });
  //  });
  //}

  LoadDepartures(){
    this.data.getDeparturesByDates(this.NewDate.toString()).subscribe((res: Array<Departure>) => {

      this.Departs = res;

      for (var i = 0; i < this.Departs.length; i++) {
        this.data.getBookingsByDeparture(this.Departs[i].DepartureID).subscribe((res: Array<Booking>) => {
          this.Bookings = res;
          console.log(this.Bookings)
        });
      }
      console.log(this.Departs)
      
      //this.LoadBookingsByDepartures()
      

   

    })
}
 

}

export class Booking {
  BookingID: number
  FK_UserID: number
  FK_GuestID: number
  FK_DepartureID: number
  FK_AccomodationID: number
  BookingDate: Date
  BookingCreatedOn: Date
  BookingVoucher: string
  BookingStatus: Date
  BookingAdultsCount: number
  BookingFreeAdultsCount: number
  BookingChildrenCount: number
  BookingFreeChildrenCount: number
  BookingStudentsCount: number
  BookingModified: boolean
  BookingIsActive: boolean
}



export class Departure {
  DepartureID: number
  FK_SeasonID: number
  FK_ShipID: number
  DepartureHour: string
  DepartureMaxPassenger: number
  DepartureMaxAdults: number
  DepartureDate: Date
  AdultsCount: number
  ChildrenCount: number
  StudentsCount: number
  FreePassCount: number
  TotalPassenger: number
  BookingList: Array<Booking>
}

export class Ship {
  ShipID: number
  FK_ShipDesignID: number
  ShipName: string
  ShipDescription: string
  ShipMaxPassenger: number
  ShipIsPublic: boolean
  ShipPriority: number
  ShipIsActive: boolean
}
