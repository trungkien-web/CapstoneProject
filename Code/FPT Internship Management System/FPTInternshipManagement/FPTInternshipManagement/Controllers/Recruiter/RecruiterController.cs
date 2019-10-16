using Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Repository.Common;

namespace FPTInternshipManagement.Controllers.Recruiter
{
    public class RecruiterController : Controller
    {
        // GET: Recruiter
        public ActionResult Index()
        {
			if (CommonSession.SESSION_ROLE_RECRUITMENT())
			{
				return View();
			}
			else
			{
				return RedirectToAction("Index","Home");
			}
        }
		public ActionResult PublishedRecruitment()
		{
			return View();
		}
		public ActionResult SearchStudent()
		{
			return View();
		}
	}
}