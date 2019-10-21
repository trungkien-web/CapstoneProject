using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
	public interface IRateService
	{
		//List<User> GetTopRecruiter();
		Dictionary<User, int> GetTotalJobByRecruiter();
		Dictionary<User, string> GetLocaltionByRecruiter();
		Dictionary<User, string> GetImageByRecruiter();
	}
}
