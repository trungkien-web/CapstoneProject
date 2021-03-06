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
    
    public partial class Account
    {
        public int AccountID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int Type { get; set; }
        public string StudentID { get; set; }
        public Nullable<int> RecruiterID { get; set; }
        public Nullable<int> AdminID { get; set; }
        public int StatusID { get; set; }
    
        public virtual Admin Admin { get; set; }
        public virtual Recruiter Recruiter { get; set; }
        public virtual RoleType RoleType { get; set; }
        public virtual Status Status { get; set; }
        public virtual Student Student { get; set; }
    }
}
