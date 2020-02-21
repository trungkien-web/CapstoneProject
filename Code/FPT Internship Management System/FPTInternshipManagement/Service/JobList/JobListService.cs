using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    //Get all Job
	public class JobListService : IJobListService
    {
        IJobRepository jobRepository = new JobRepository();

		public List<Job> GetAllJob()
		{
            //Return all job
			return jobRepository.GetAllJobs();
		}
	}
}
