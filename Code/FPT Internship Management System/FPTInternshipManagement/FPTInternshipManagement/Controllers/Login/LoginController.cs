using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Helper;
using Service;
using FPTInternshipManagement.Common;
using System.Web.Security;

namespace FPTInternshipManagement.Controllers.Login
{
	[Authorize]
	public class LoginController : Controller
	{
		ILoginService loginService = new LoginService();
		IUserService userService = new UserService();

		// GET: Login
		[AllowAnonymous]
		public ActionResult Index()
		{
			return View();
		}

		[HttpPost]
		[AllowAnonymous]
		public ActionResult Autherize(User user)
		{

			if (ModelState.IsValid)
			{
				
				if (loginService.CheckLogin(user.Username, user.Password))
				{
					FormsAuthentication.SetAuthCookie(user.Username, false);
					string role = loginService.GetRole(user);
					var u = userService.GetUserByName(user.Username);
					SessionHelper.SetSession(new UserSession { UserID = u.UserID, Name = u.Name, Role = role });
					Session["name"] = u.Name; 
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
				TempData["LoginErrorMessage"] = loginService.GetErrorMessage();
				return RedirectToAction("LoginForm", "Login");
			}

			return RedirectToAction("Index", "Home");
		}

		[AllowAnonymous]
		public ActionResult LoginForm()
		{
			TempData["Script"] = "<script>$(document).ready(function() {$('#exampleModal').modal('show');});</script>";
			return RedirectToAction("Index", "Home");
		}

		public ActionResult Logout()
		{
			Session.Abandon();
			FormsAuthentication.SignOut();
			return RedirectToAction("Index", "Home");
		}

	}
}