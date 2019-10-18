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
		IRateRepository repository = new RateRepository();

		public Dictionary<User, string> GetLocaltionByRecruiter()
		{
			return repository.GetLocaltionByRecruiter();
		}

		//public List<User> GetTopRecruiter()
		//{
		//	
		//	return repository.GetTopRecruiter();
		//}
		public Dictionary<User, int> GetTotalJobByRecruiter()
		{
			return repository.GetTotalJobByRecruiter();
		}
	}
}
