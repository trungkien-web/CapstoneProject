using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
	public class RateSevice : IRateService
	{
		private IRateRepository repository = new RateRepository();
		public List<Recruiter> getTopRate()
		{
			return repository.getTopRate();
		}
	}
}
