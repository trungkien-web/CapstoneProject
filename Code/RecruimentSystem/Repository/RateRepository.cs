using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public class RateRepository : IRateRepository
	{
		private RecruitmentSystemEntities ctx = new RecruitmentSystemEntities();

		public List<Recruiter> getTopRate()
		{
			throw new NotImplementedException();
		}
	}
}
