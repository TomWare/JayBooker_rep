//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Logbook
    {
        public int FK_UserID { get; set; }
        public int FK_DepartureID { get; set; }
        public string LogBoatName { get; set; }
        public short LogAdultCount { get; set; }
        public short LogChildrenCount { get; set; }
        public string Weather { get; set; }
        public string Wind { get; set; }
        public string Waves { get; set; }
        public bool Whale { get; set; }
        public string Observations { get; set; }
    
        public virtual Departures Departures { get; set; }
        public virtual Users Users { get; set; }
    }
}
