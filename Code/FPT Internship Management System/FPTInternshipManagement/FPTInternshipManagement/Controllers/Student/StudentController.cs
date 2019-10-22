using FPTInternshipManagement.Common;
using FPTInternshipManagement.Models;
using Helper;
using Model;
using Repository.Common;
using Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Controllers.Student
{
    public class StudentController : Controller
    {
		ISkillService service = new SkillService();
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
			SkillViewModel model = new SkillViewModel();
			model.GetSkillViewModels = service.GetAllSkills().Select(x => new SkillViewModel { SkillID = x.SkillID, SkillName = x.SkillName }).ToList();
			return View(model);
		}

		[HttpPost]
		public ActionResult GetSkill(SkillViewModel model)
		{
			TempData["name"] = Request.Form["AspirationsName"];
			TempData["Salary"] = Request.Form["Salary"];
			TempData["Description"] = Request.Form["Description"];
			List<int> list = model.SkillList.OfType<int>().ToList();
			string str = "";
			foreach(int a in list)
			{
				str += service.GetSkillById(a).SkillName + " ";
			}
			TempData["Script"] = "<script>$(document).ready(function() {$('.nav-tabs a[data_id=2]').tab('show');});</script>";
			TempData["listskill"] = str;
			return RedirectToAction("MyProfile");

		}

		[HttpPost]
		public ActionResult SaveAspiration(SkillViewModel model)
		{
			//code
			return RedirectToAction("MyProfile");

		}

	}
}
