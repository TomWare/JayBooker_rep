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
    public class ShipsController : ApiController
    {
        private CroisiereEscoumins2020Entities db = new CroisiereEscoumins2020Entities();

        // GET: api/Ships
        public List<ShipDisplay> GetShips()
        {
            var ships = (from s in db.Ships
                               select new ShipDisplay
                               {
                                   ShipID = s.ShipID,
                                   FK_ShipDesignID = s.FK_ShipDesignID,
                                   ShipName = s.ShipName,
                                   ShipDescription = s.ShipDescription,
                                   ShipMaxPassenger = s.ShipMaxPassengers,
                                   ShipIsPublic= s.ShipIsPublic,
                                   ShipPriority = s.ShipPriority,
                                   ShipIsActive = s.ShipIsActive,
                               });

            return ships.ToList();
        }

        // GET: api/Ships/5
        [ResponseType(typeof(Ships))]
        public IHttpActionResult GetShips(int id)
        {
            Ships ships = db.Ships.Find(id);
            if (ships == null)
            {
                return NotFound();
            }

            return Ok(ships);
        }

        // PUT: api/Ships/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutShips(int id, Ships ships)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != ships.ShipID)
            {
                return BadRequest();
            }

            db.Entry(ships).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ShipsExists(id))
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

        // POST: api/Ships
        [ResponseType(typeof(Ships))]
        public IHttpActionResult PostShips(Ships ships)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Ships.Add(ships);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = ships.ShipID }, ships);
        }

        // DELETE: api/Ships/5
        [ResponseType(typeof(Ships))]
        public IHttpActionResult DeleteShips(int id)
        {
            Ships ships = db.Ships.Find(id);
            if (ships == null)
            {
                return NotFound();
            }

            db.Ships.Remove(ships);
            db.SaveChanges();

            return Ok(ships);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ShipsExists(int id)
        {
            return db.Ships.Count(e => e.ShipID == id) > 0;
        }
    }

    public class ShipDisplay
    {
        public int ShipID { get; set; }
        public int FK_ShipDesignID { get; set; }
        public string ShipName { get; set; }
        public string ShipDescription { get; set; }
        public byte ShipMaxPassenger { get; set; }
        public bool ShipIsPublic { get; set; }
        public byte ShipPriority { get; set; }
        public bool ShipIsActive { get; set; }
    }
}