using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Controllers.Login
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

		[HttpPost]
		public ActionResult Autherize(User user)
		{
			using (FptInternshipManagermentEntities db = new FptInternshipManagermentEntities())
			{
				var userDetails = db.Users.Where(x => x.Username == user.Username && x.Password == user.Password).FirstOrDefault();
				if(userDetails == null)
				{
					ViewBag.ErrorMessage = "Login Fail";
					return Redirect("/Home");
				}
			}
			return View();
		}
	}
}