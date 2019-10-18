using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
	public class RateService : IRateService
	{
		public List<User> GetTopRecruiter()
		{
			IRateRepository repository = new RateRepository();
			return repository.GetTopRecruiter();
		}
	}
}
