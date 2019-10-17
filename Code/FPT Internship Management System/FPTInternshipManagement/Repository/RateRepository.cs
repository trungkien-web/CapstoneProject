using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository.Common;

namespace Repository
{
	public class RateRepository : IRateRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		public Dictionary<int,double> CalRate()
		{
			List<Rate> rates = GetAllRates();
			List<int> idList = new List<int>();
			foreach(Rate r in rates)
			{
				idList.Add(r.RecruiterID);
			}
			var dictionary = idList.GroupBy(x => x).Where(g => g.Count() > 1).ToDictionary(x => x.Key, y => (double) y.Count());
			foreach(var key in idList.GroupBy(x => x).Where(g => g.Count() > 1).ToDictionary(x => x.Key, y => (double)y.Count()))
			{
				double total = 0;
				foreach(Rate rate in rates)
				{
					if(rate.RecruiterID == key.Key)
					{
						total += rate.Star;
					}
				}
				dictionary[key.Key] /= total;
			}
			return dictionary;
			
		}


		public List<Rate> GetAllRates()
		{
			var list = ctx.Rates.ToList();
			return list;
		}

		public List<User> GetTopRecruiter()
		{
			var idList = CalRate().OrderBy(x => x.Value).Select(p => p.Key).ToList().Take(6);
			List<User> list = new List<User>();
			var listUsers = CommonUser.GET_ALL_USER();
			foreach(int id in idList)
			{
				foreach(User user in listUsers)
				{
					if(id == user.UserID)
					{
						list.Add(user);
					}
				}
			}
			return list;
		}
	}
}
