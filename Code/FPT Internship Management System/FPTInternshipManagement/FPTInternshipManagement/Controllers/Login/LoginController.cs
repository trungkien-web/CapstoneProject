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
			using (FPTInternshipManagermentEntities db = new FPTInternshipManagermentEntities())
			{
				var userDetails = db.Users.Where(x => x.Username == user.Username && x.Password == user.Password).FirstOrDefault();
				if(userDetails == null)
				{
<<<<<<< HEAD
<<<<<<< HEAD
					ViewBag.ErrorMessage = "Login Fail";
					return Redirect("/Home");
				}
			}
			return View();
=======
=======
>>>>>>> parent of c05c8c1... DUCDD_Commit Code_Update Database
					TempData["Script"] = "<script>$(document).ready(function() {$('#exampleModal').modal('show');});</script>";
					ViewBag.MessageError = "Login Error!";
					return RedirectToAction("Index", "Home");
				} else
				{
					return Redirect("/Recruiter");
				}
			}
<<<<<<< HEAD
>>>>>>> parent of c05c8c1... DUCDD_Commit Code_Update Database
=======
>>>>>>> parent of c05c8c1... DUCDD_Commit Code_Update Database
		}
	}
}