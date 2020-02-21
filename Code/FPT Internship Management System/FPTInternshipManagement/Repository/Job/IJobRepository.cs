using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//HoaNA update interface
namespace Repository
{
	public interface IJobRepository
	{
		List<Job> GetAllJobs();
	}
}
