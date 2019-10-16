using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Helper;
using Service;
using FPTInternshipManagement.Common;

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
			ILoginService service = new LoginService();
			try
			{
				string role = service.GetRole(user);
				if (role == null)
				{
					TempData["Script"] = "<script>$(document).ready(function() {$('#exampleModal').modal('show');});</script>";
					TempData["LoginErrorMessage"] = user.LoginErrorMessage;
					return RedirectToAction("Index", "Home");
				}
				else
				{
					SessionHelper.SetSession(new UserSession { UserID = user.UserID, Name = user.Name, Role = role });
				}
				if (role == CommonConstants.RECRUITER_ROLE)
				{
					return Redirect("/Recruiter");
				}
				else if (role == CommonConstants.ADMIN_ROLE)
				{
					return Redirect("/Admin");
				}
				else if (role == CommonConstants.STUDENT_ROLE)
				{
					return Redirect("/Student");
				}
			}
			catch (Exception ex)
			{
				TempData["ErrorMessgae"] = ex.Message;
				return RedirectToAction("Index", "Error");
			}

			return RedirectToAction("Index", "Home");
		}

		public ActionResult Logout()
		{
			Session.Abandon();
			return RedirectToAction("Index", "Home");
		}

	}
}