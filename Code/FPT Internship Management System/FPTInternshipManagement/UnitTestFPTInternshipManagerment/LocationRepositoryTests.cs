using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repository;

namespace UnitTestFPTInternshipManagerment
{
    [TestClass]
    public class LocationRepositoryTests
    {
        ILocationRepository locationRepository = new LocationRepository();
        [TestMethod]
        public void TestGetLocation()
        {
            var listLocation = locationRepository.GetAllLocation();
            foreach(var location in listLocation)
            {
                locationRepository.GetLocationById(location.LocationID);
            }
        }
    }
}
