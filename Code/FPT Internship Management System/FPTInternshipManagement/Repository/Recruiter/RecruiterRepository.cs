using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Repository.Recruiment
{
    public class RecruiterRepository
    {
        FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
        public List<Job> searchJob(string job, string location)
        {
            var jobs = from j in ctx.Jobs
                       join loca in ctx.Locations on j.LocationID equals loca.LocationID
                       where
                            (j.JobName.Contains(job) || j.ContentJob.Contains(job))
                            && loca.LocationDetail.Contains(location)
                       select j;
            return jobs.ToList();
        }
    }
}
