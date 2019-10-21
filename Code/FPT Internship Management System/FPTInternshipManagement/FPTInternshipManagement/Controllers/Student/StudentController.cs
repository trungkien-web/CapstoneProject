using FPTInternshipManagement.Common;
using Helper;
using Repository.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Controllers.Student
{
    public class StudentController : Controller
    {
        // GET: Student
        public ActionResult Index()
        {
			if (CommonSession.SESSION_ROLE_STUDENT())
			{
				return View();
			}
			else
			{
				return RedirectToAction("Index", "Home");
			}
        }

		public ActionResult MyProfile()
		{
			//if (CommonSession.SESSION_ROLE_STUDENT())
			//{
			//	return View();
			//}
			//else
			//{
			//	return RedirectToAction("Index", "Home");
			//}

			return View();
		}
	}
}
