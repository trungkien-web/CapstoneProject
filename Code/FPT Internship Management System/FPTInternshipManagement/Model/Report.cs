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
    
    public partial class Report
    {
        public int ReportID { get; set; }
        public Nullable<int> RecruiterID { get; set; }
        public Nullable<int> StudentID { get; set; }
        public string Course { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public Nullable<double> Grade { get; set; }
        public string Comment { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> LastModifyDate { get; set; }
        public Nullable<int> RateID { get; set; }
    
        public virtual Department Department { get; set; }
        public virtual Rate Rate { get; set; }
        public virtual User User { get; set; }
        public virtual User User1 { get; set; }
        public string recruitername { get; set; }
        public string studentname { get; set; }
        public string studentcode { get; set; }
    }
}
