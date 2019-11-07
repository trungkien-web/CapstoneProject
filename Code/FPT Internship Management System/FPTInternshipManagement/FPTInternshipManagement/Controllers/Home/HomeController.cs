using Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			IDepartmentService departmentService = new DepartmentService();
			IRateService rateService = new RateService();
			Dictionary<string, string> keyValues= departmentService.GetToDictionaryHome();
			ViewBag.KeyValues = keyValues;
			ViewBag.TopRecruiter = rateService.GetTotalJobByRecruiter();
			ViewBag.TopLocation = rateService.GetLocaltionByRecruiter();
			ViewBag.TopImage = rateService.GetImageByRecruiter();
            //ViewBag.StartUL = "<ul class=\"list-unstyled py-md-5 py-3 partners-icon text- center\" style=\"width: max-content;\">";
            ViewBag.StartUL = "<tr>";
            ViewBag.EndUL = "</tr>";
            //ViewBag.EndUL = "</ul>";
            return View();
		}
		public ActionResult JobList()
		{
			return View();
		}
		public ActionResult JobDetail()
		{
			return View();
		}
		public ActionResult Contact()
		{
			return View();
		}
	}
}