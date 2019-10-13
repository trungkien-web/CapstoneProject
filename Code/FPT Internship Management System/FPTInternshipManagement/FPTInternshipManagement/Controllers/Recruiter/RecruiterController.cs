using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Controllers.Recruiter
{
    public class RecruiterController : Controller
    {
        // GET: Recruiter
        public ActionResult Index()
        {
            return View();
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