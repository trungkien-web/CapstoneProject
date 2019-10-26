using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Repository.Recruiment
{
    public interface IRecruiterRepository
    {
        List<Job> searchJob(string job, string location);
    }
}
