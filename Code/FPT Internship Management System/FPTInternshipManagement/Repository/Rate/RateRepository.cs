using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FPTInternshipManagement.Common;
using Model;
using Repository.Common;

namespace Repository
{
	public class RateRepository : IRateRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		IUserRepository userRepository = new UserRepository();
		ILocationRepository locationRepository = new LocationRepository();
		IImageRepository imageRepository = new ImageRepository();
		public Dictionary<int, double> CalRate()
		{
			List<Rate> rates = GetAllRates();
			List<int> idList = new List<int>();
			foreach (Rate r in rates)
			{
				idList.Add(r.RecruiterID);
			}
			var dictionary = idList.GroupBy(x => x).Where(g => g.Count() > 1).ToDictionary(x => x.Key, y => (double)y.Count());
			foreach (var key in idList.GroupBy(x => x).Where(g => g.Count() > 1).ToDictionary(x => x.Key, y => (double)y.Count()))
			{
				double total = 0;
				foreach (Rate rate in rates)
				{
					if (rate.RecruiterID == key.Key)
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

		public Dictionary<User, string> GetImageByRecruiter()
		{
			List<User> list = GetTopRecruiter();
			Dictionary<User, string> keyValuePairs = new Dictionary<User, string>();
			foreach (User user in list)
			{
				int id = (int)user.ImageID;
				Image image = imageRepository.GetImageById(id);
				keyValuePairs.Add(user, image.Path);
			}
			return keyValuePairs;
		}

		public Dictionary<User, string> GetLocaltionByRecruiter()
		{
			List<User> list = GetTopRecruiter();
			Dictionary<User, string> keyValuePairs = new Dictionary<User, string>();
			foreach (User user in list)
			{
				int id = (int) user.LocationID;
				Location location = locationRepository.GetLocationById(id);
				//keyValuePairs.Add(user, location.City);
			}
			return keyValuePairs;
		}

		public List<User> GetTopRecruiter()
		{
			var idList = CalRate().OrderBy(x => x.Value).Select(p => p.Key).ToList().Take(6);
			List<User> list = new List<User>();
			var listUsers = userRepository.GetAllUser();
			foreach (int id in idList)
			{
				foreach (User user in listUsers)
				{
					if (id == user.UserID)
					{
						list.Add(user);
					}
				}
			}
			return list;
		}

		public Dictionary<User, int> GetTotalJobByRecruiter()
		{
			List<User> list = GetTopRecruiter();
			Dictionary<User, int> keyValuePairs = new Dictionary<User, int>();
			foreach (User user in list)
			{
				var count = ctx.Jobs.Where(j => j.RecruiterID == user.UserID && j.Status == CommonConstants.JOB_STATUS_AVAILABLE).Count();
				var img = ctx.Images.Where(x => x.ImageID == user.ImageID).FirstOrDefault().Path;
				user.GPA = img;
				var location = ctx.Locations.Where(x => x.LocationID == user.LocationID).FirstOrDefault().LocationDetail;
				user.Specialized = location;
				keyValuePairs.Add(user, count);
			}
			return keyValuePairs;
			
		}
	}
}
