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
    
    public partial class SkillStudentAspiration
    {
        public int SkillStudentAspirationID { get; set; }
        public int SkillID { get; set; }
        public int StudentAspirationsID { get; set; }
    
        public virtual Skill Skill { get; set; }
        public virtual StudentAspiration StudentAspiration { get; set; }
    }
}