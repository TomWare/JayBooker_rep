import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  //IIS url
  //url = "http://localhost/api/"
  //Backend direct debug
  url = "http://localhost:61569/api/"


  constructor(private http: HttpClient) { }

  getShips() {
    return this.http.get(this.url + "ships");
  }

  getDepartures() {
    return this.http.get(this.url + "departures/");
  }

  getBookings() {
    return this.http.get(this.url + "bookings/");
  }

  getDeparturesByDates(date) {
    return this.http.get(this.url + "departuresbydates/" + date);
  }

  put(ctrl, model) {
    return this.http.post(this.url + ctrl, model);
  }

  getAll(ctrl) {
    return this.http.get(this.url + ctrl);
  }

  getBookingsByDeparture(ID) {

    return this.http.get(this.url + "getBookingsByDeparture/" + ID);

  }
}
