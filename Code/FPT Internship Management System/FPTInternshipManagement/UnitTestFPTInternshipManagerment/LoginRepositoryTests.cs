using System;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Model;
using Repository;

namespace UnitTestFPTInternshipManagerment
{
    [TestClass]
    public class LoginRepositoryTests
    {
        FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
        ILoginRepository loginRepository = new LoginRepository();
        [TestMethod]
        public void TestCheckLogin()
        {
            var username = "Admin1";
            var password = "Admin1";
            loginRepository.CheckLogin(username,password);
            loginRepository.GetErrorMessage();
            var user = ctx.Users.Where(u => u.Username == username).FirstOrDefault();
            loginRepository.GetRole(user);
        }
    }
}
