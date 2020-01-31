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
    public class BookingsController : ApiController
    {
        private CroisiereEscoumins2020Entities db = new CroisiereEscoumins2020Entities();

        // GET: api/Bookings
        public List<BookingDisplay> GetBookings()
        {
            var bookings = (from b in db.Bookings
                              select new BookingDisplay
                              {
                                  BookingID = b.BookingID,
                                  FK_UserID = b.FK_UserID,
                                  FK_GuestID = b.FK_GuestID,
                                  FK_DepartureID = b.FK_DepartureID,
                                  BookingDate = b.BookingDate,
                                  BookingCreatedOn = b.BookingCreatedOn,
                                  BookingVoucher = b.BookingVoucher,
                                  BookingStatus = b.BookingStatus,
                                  BookingAdultsCount = b.BookingAdultsCount,
                                  BookingFreeAdultsCount = b.BookingFreeAdultsCount,
                                  BookingChildrenCount = b.BookingChildrenCount,
                                  BookingFreeChildrenCount = b.BookingFreeChildrenCount,
                                  BookingStudentsCount = b.BookingStudentsCount,
                                  BookingModified = b.BookingModified,
                                  BookingIsActive = b.BookingIsActive,






                              });

            return bookings.ToList();

        }



        //GET: api/LoadBookingsByDepartures
       [HttpGet]
       [Route("api/getBookingsByDeparture/{ID}")]
        public List<BookingDisplay> getBookingsByDeparture(int ID)
        {




            var bookings = (from b in db.Bookings
                                             select new BookingDisplay
                                             {
                                                 BookingID = b.BookingID,
                                                 FK_UserID = b.FK_UserID,
                                                 FK_GuestID = b.FK_GuestID,
                                                 FK_DepartureID = b.FK_DepartureID,
                                                 BookingDate = b.BookingDate,
                                                 BookingCreatedOn = b.BookingCreatedOn,
                                                 BookingVoucher = b.BookingVoucher,
                                                 BookingStatus = b.BookingStatus,
                                                 BookingAdultsCount = b.BookingAdultsCount,
                                                 BookingFreeAdultsCount = b.BookingFreeAdultsCount,
                                                 BookingChildrenCount = b.BookingChildrenCount,
                                                 BookingFreeChildrenCount = b.BookingFreeChildrenCount,
                                                 BookingStudentsCount = b.BookingStudentsCount,
                                                 BookingModified = b.BookingModified,
                                                 BookingIsActive = b.BookingIsActive,
                                             }).Where(t => t.FK_DepartureID == ID);

            return bookings.ToList();

        }



        // GET: api/Bookings/5
        [ResponseType(typeof(Bookings))]
        public IHttpActionResult GetBookings(int id)
        {
            Bookings bookings = db.Bookings.Find(id);
            if (bookings == null)
            {
                return NotFound();
            }

            return Ok(bookings);
        }

        // PUT: api/Bookings/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutBookings(int id, Bookings bookings)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != bookings.BookingID)
            {
                return BadRequest();
            }

            db.Entry(bookings).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookingsExists(id))
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

        // POST: api/Bookings
        [ResponseType(typeof(Bookings))]
        public IHttpActionResult PostBookings(Bookings bookings)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Bookings.Add(bookings);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = bookings.BookingID }, bookings);
        }

        // DELETE: api/Bookings/5
        [ResponseType(typeof(Bookings))]
        public IHttpActionResult DeleteBookings(int id)
        {
            Bookings bookings = db.Bookings.Find(id);
            if (bookings == null)
            {
                return NotFound();
            }

            db.Bookings.Remove(bookings);
            db.SaveChanges();

            return Ok(bookings);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BookingsExists(int id)
        {
            return db.Bookings.Count(e => e.BookingID == id) > 0;
        }
    }

    public class BookingDisplay
    {
        public int BookingID { get; set; }
        public int FK_UserID { get; set; }
        public int FK_GuestID { get; set; }
        public int? FK_DepartureID { get; set; }
        public DateTime BookingDate { get; set; }
        public DateTime BookingCreatedOn { get; set; }
        public string BookingVoucher { get; set; }
        public string BookingStatus { get; set; }
        public short BookingAdultsCount { get; set; }
        public short BookingFreeAdultsCount { get; set; }
        public short BookingChildrenCount { get; set; }
        public short BookingFreeChildrenCount { get; set; }
        public short BookingStudentsCount { get; set; }
        public bool BookingModified { get; set; }
        public bool BookingIsActive { get; set; }
    }
}