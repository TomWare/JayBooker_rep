using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using JayBookerBackEnd.Model;

namespace JayBookerBackEnd.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DeparturesController : ApiController
    {
        private CroisiereEscoumins2020Entities db = new CroisiereEscoumins2020Entities();

        // GET: api/Departures
        public List<DepartureDisplay> GetDepartures()
        {
            var departures = (from d in db.Departures
                         select new DepartureDisplay
                         {
                             DepartureID = d.DepartureID,
                             FK_SeasonID = d.FK_SeasonID,
                             FK_ShipID = d.FK_ShipID,
                             DepartureHour= d.DepartureHour,
                             DepartureMaxPassengers = d.DepartureMaxPassengers,
                             DepartureMaxAdult= d.DepartureMaxAdults,
                             DepartureDate = d.DepartureDate,
                             
                         });

            return departures.ToList();
          
        }


        // GET: api/DeparturesByDates
        [HttpGet]
        [Route("api/departuresbydates/{date}")]
        public List<DepartureDisplay> GetDeparturesByDates(string date)
        {
            var year = Int32.Parse(date.Substring(0, 4));
            var month = Int32.Parse(date.Substring(5, 2));
            var day = Int32.Parse(date.Substring(8, 2));

            DateTime currentDate = new DateTime(year,month,day);

            var departures = (from d in db.Departures
                              select new DepartureDisplay
                              {
                                  DepartureID = d.DepartureID,
                                  FK_SeasonID = d.FK_SeasonID,
                                  FK_ShipID = d.FK_ShipID,
                                  DepartureHour = d.DepartureHour,
                                  DepartureMaxPassengers = d.DepartureMaxPassengers,
                                  DepartureMaxAdult = d.DepartureMaxAdults,
                                  DepartureDate = d.DepartureDate,
                                
                                  AdultsCount = db.Bookings.Where(t => d.DepartureID == t.FK_DepartureID).Sum(t=>t.BookingFreeAdultsCount + t.BookingAdultsCount),
                                  ChildrenCount = db.Bookings.Where(t => d.DepartureID == t.FK_DepartureID).Sum(t=>t.BookingChildrenCount + t.BookingFreeChildrenCount),
                                  StudentsCount = db.Bookings.Where(t => d.DepartureID == t.FK_DepartureID).Sum(t => t.BookingStudentsCount),
                                  FreePassCount = db.Bookings.Where(t => d.DepartureID == t.FK_DepartureID).Sum(t=>t.BookingFreeChildrenCount + t.BookingFreeAdultsCount),
                                  TotalPassenger = db.Bookings.Where(t=> d.DepartureID == t.FK_DepartureID).Sum(t => t.BookingAdultsCount +  + t.BookingChildrenCount + t.BookingFreeAdultsCount + t.BookingFreeChildrenCount + t.BookingStudentsCount)
                              }).Where(t => t.DepartureDate == currentDate);

            return departures.ToList();

        }

        // GET: api/Departures/5
        [ResponseType(typeof(Departures))]
        public IHttpActionResult GetDepartures(int id)
        {
            Departures departures = db.Departures.Find(id);
            if (departures == null)
            {
                return NotFound();
            }

            return Ok(departures);
        }

        // PUT: api/Departures/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutDepartures(int id, Departures departures)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != departures.DepartureID)
            {
                return BadRequest();
            }

            db.Entry(departures).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DeparturesExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Departures
        [ResponseType(typeof(Departures))]
        public IHttpActionResult PostDepartures(Departures departures)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Departures.Add(departures);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = departures.DepartureID }, departures);
        }

        // DELETE: api/Departures/5
        [ResponseType(typeof(Departures))]
        public IHttpActionResult DeleteDepartures(int id)
        {
            Departures departures = db.Departures.Find(id);
            if (departures == null)
            {
                return NotFound();
            }

            db.Departures.Remove(departures);
            db.SaveChanges();

            return Ok(departures);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DeparturesExists(int id)
        {
            return db.Departures.Count(e => e.DepartureID == id) > 0;
        }
    }

    public class DepartureDisplay
    {
        public int DepartureID { get; set; }
        public int? FK_SeasonID { get; set; }
        public int? FK_ShipID { get; set; }
        public string DepartureHour { get; set; }
        public short DepartureMaxPassengers { get; set; }
        public short? DepartureMaxAdult { get; set; }
        public DateTime DepartureDate { get; set; }
        public int? AdultsCount { get; internal set; }
        public int? ChildrenCount { get; internal set; }
        public int? StudentsCount { get; internal set; }
        public int? FreePassCount { get; internal set; }
        public int? TotalPassenger { get; internal set; }
    }
}