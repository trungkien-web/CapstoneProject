//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Experience
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Experience()
        {
            this.Aspirations = new HashSet<Aspiration>();
        }
    
        public int ExperienceID { get; set; }
        public int UserID { get; set; }
        public int SkillID { get; set; }
        public System.DateTime StartDate { get; set; }
        public string Description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Aspiration> Aspirations { get; set; }
        public virtual Skill Skill { get; set; }
        public virtual User User { get; set; }
    }
}