﻿using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public interface IRateRepository
	{
		List<Rate> GetAllRates();
		Dictionary<int,double> CalRate();
		List<User> GetTopRecruiter();
		Dictionary<User,int> GetTotalJobByRecruiter();
		Dictionary<User, string> GetLocaltionByRecruiter();
		Dictionary<User, string> GetImageByRecruiter();
	}
}
