﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JayBookerBackEnd.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CroisiereEscoumins2020Entities : DbContext
    {
        public CroisiereEscoumins2020Entities()
            : base("name=CroisiereEscoumins2020Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AccomodationRates> AccomodationRates { get; set; }
        public virtual DbSet<Accomodations> Accomodations { get; set; }
        public virtual DbSet<AccomodationTypes> AccomodationTypes { get; set; }
        public virtual DbSet<BookingHistory> BookingHistory { get; set; }
        public virtual DbSet<Bookings> Bookings { get; set; }
        public virtual DbSet<Departures> Departures { get; set; }
        public virtual DbSet<Emails> Emails { get; set; }
        public virtual DbSet<EmailTemplates> EmailTemplates { get; set; }
        public virtual DbSet<Guests> Guests { get; set; }
        public virtual DbSet<InvoicedBookings> InvoicedBookings { get; set; }
        public virtual DbSet<InvoicedProducts> InvoicedProducts { get; set; }
        public virtual DbSet<Invoices> Invoices { get; set; }
        public virtual DbSet<Logbook> Logbook { get; set; }
        public virtual DbSet<Payments> Payments { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<Seasons> Seasons { get; set; }
        public virtual DbSet<ShipDesigns> ShipDesigns { get; set; }
        public virtual DbSet<ShipRates> ShipRates { get; set; }
        public virtual DbSet<Ships> Ships { get; set; }
        public virtual DbSet<SupplierRates> SupplierRates { get; set; }
        public virtual DbSet<Suppliers> Suppliers { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Users> Users { get; set; }
    }
}
