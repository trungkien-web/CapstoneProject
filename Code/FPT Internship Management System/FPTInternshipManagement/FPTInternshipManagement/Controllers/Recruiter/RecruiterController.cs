using Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Repository.Common;

namespace FPTInternshipManagement.Controllers.Recruiter
{
	[Authorize(Roles = "Recruiter")]
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