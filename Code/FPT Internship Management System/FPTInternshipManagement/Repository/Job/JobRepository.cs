using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Repository
{
	public class JobRepository : IJobRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		public List<Job> GetAllJobs()
		{
			var jobs = ctx.Jobs.ToList();
			return jobs;
		}

	}
}
