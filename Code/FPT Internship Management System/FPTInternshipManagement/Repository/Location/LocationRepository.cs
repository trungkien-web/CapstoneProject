using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public class LocationRepository : ILocationRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		public Location GetLocationById(int id)
		{
			var location = ctx.Locations.Where(l => l.LocationID == id).FirstOrDefault();
			return location;
		}
	}
}
