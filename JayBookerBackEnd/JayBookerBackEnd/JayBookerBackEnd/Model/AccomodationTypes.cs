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
    
    public partial class AccomodationTypes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AccomodationTypes()
        {
            this.Accomodations = new HashSet<Accomodations>();
        }
    
        public int AccomodationTypeID { get; set; }
        public string AccomodationTypeName { get; set; }
        public string AccomodationTypeDescription { get; set; }
        public bool AccomodationTypeIsActive { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Accomodations> Accomodations { get; set; }
    }
}
