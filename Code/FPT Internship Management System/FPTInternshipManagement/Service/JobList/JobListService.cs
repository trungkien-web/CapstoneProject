using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
	public class JobListService : IJobListService
    {
        IJobRepository jobRepository = new JobRepository();

		public List<Job> GetAllJob()
		{
			return jobRepository.GetAllJobs();
		}
	}
}
