using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repository;

namespace UnitTestFPTInternshipManagerment
{
    [TestClass]
    public class ImageRepositoryTests
    {
        [TestMethod]
        public void TestGetImageById()
        {
            IImageRepository imageRepository = new ImageRepository();
            var id = 1;
            imageRepository.GetImageById(id);

        }
    }
}
