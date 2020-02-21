using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;

namespace FPTInternshipManagement.Models
{
    public class JobListModel
    {
        public int JobID { get; set; }
        public string JobName { get; set; }
        public string ContentJob { get; set; }
        public string LocationName { get; set; }

        public int LocationID { get; set; }
        public string Recruiter { get; set; }
        public Nullable<int> AmountStudent { get; set; }
        public string Status { get; set; }
        public string ListSkill { get; set; }

    }
}