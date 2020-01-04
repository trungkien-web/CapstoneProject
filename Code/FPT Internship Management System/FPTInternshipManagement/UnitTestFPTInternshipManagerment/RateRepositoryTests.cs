using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repository;

namespace UnitTestFPTInternshipManagerment
{
    [TestClass]
    public class RateRepositoryTests
    {
        IRateRepository rateRepository = new RateRepository();
        [TestMethod]
        public void TestCalRate()
        {
            rateRepository.CalRate();
        }

        [TestMethod]
        public void TestGetImageByRecruiter()
        {
            rateRepository.GetImageByRecruiter();
        }

        
    }
}
