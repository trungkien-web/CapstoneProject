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
    
    public partial class StudentReport
    {
        public int StudentReportID { get; set; }
        public string StudentID { get; set; }
        public string StudentName { get; set; }
        public string Course { get; set; }
        public int DepartmentID { get; set; }
        public int RecruiterID { get; set; }
        public double Grade { get; set; }
        public string Comment { get; set; }
    
        public virtual Department Department { get; set; }
        public virtual Recruiter Recruiter { get; set; }
        public virtual Student Student { get; set; }
    }
}