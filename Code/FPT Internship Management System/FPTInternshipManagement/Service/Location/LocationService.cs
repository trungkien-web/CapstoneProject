using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Service
{
	public class LocationService : ILocationService
    {
        ILocationRepository locationRepository = new LocationRepository();

		public string GetLocation(int id)
		{
            Location a = locationRepository.GetLocationById(id);
            if (a != null)
            {
                return a.LocationDetail;
            }
            return "";
		}

        public List<Location> GetAllLocation()
        {
            List<Location> a = locationRepository.GetAllLocation();
            return a;
        }
    }
}
