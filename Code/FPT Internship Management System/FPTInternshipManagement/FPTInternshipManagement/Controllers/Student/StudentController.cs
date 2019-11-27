using FPTInternshipManagement.Common;
using FPTInternshipManagement.Models;
using Helper;
using Model;
using Repository.Common;
using Service;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Controllers.Student
{

	[Authorize(Roles = "Student")]
	public class StudentController : Controller
	{
		ISkillService skillService = new SkillService();
		IDepartmentService departmentService = new DepartmentService();
		IStudentAspirationService studentAspirationService = new StudentAspirationService();
		// GET: Student

		public ActionResult Index()
		{
			return View();
		}


		public ActionResult MyProfile()
		{
			//List<Department> departments = departmentService.GetAllDepartments();
			//StudentViewModel model = new StudentViewModel();
 		//	string selected = departments.ElementAt(0).DepartmentID.ToString();
   //         model.AvailableSkills = new List<SelectListItem>(GetSkills(Int32.Parse(selected)));
			//model.GetAllDepartment = departments;
			//model.SelectListItems = GetDepartments(departments);

			return View();
		}

		[HttpPost]
		public ActionResult MyProfile(StudentViewModel model)
		{
			//try
			//{
			//	string selected = Request.Form["dropdownDepartment"];
			//	if (ModelState.IsValid)
			//	{
			//		model.AvailableSkills = new List<SelectListItem>(GetSkills(Int32.Parse(selected)));
			//		List<Department> departments = departmentService.GetAllDepartments();
			//		model.SelectListItems = GetDepartments(departments);
			//		model.SelectedDepartmentId = Int32.Parse(selected);
			//		TempData["Name"] = Request.Form["AspirationsName"];
			//		TempData["Salary"] = Request.Form["Salary"];
			//		TempData["Description"] = Request.Form["Description"];
			//		TempData["Script"] = "<script>$(document).ready(function() {$('.nav-tabs a[data_id=2]').tab('show');});</script>";
			//	}
			//}
			//catch (Exception ex)
			//{
			//	throw ex;
			//}

			return View(model);

		}


		[HttpPost]
		public ActionResult SaveAspiration(StudentViewModel model)
		{
			//List<string> listId = new List<string>(model.SelectedSkills);
			//try
			//{
			//	var user = (UserSession)SessionHelper.GetSession();
			//	int userId = user.UserID;
			//	var aspiration = new Aspiration();
			//	aspiration.AspirationsName = Request.Form["AspirationsName"];
			//	aspiration.Salary = Convert.ToDouble(Request.Form["Salary"]);
			//	aspiration.Description = Request.Form["Description"];
				
			//	studentAspirationService.InsertStudentAspiration(aspiration, userId, listId);
			//}
			//catch (DbEntityValidationException dbEx)
			//{
			//	foreach (var validationErrors in dbEx.EntityValidationErrors)
			//	{
			//		foreach (var validationError in validationErrors.ValidationErrors)
			//		{
			//			Trace.TraceInformation("Property: {0} Error: {1}",
			//									validationError.PropertyName,
			//									validationError.ErrorMessage);
			//		}
			//	}
			//}
			return RedirectToAction("MyProfile", "Student");

		}
		//private List<SelectListItem> GetSkills(int id)
		//{
		//	List<SelectListItem> list = new List<SelectListItem>();
		//	foreach (var skill in skillService.GetSkillsByDepartmentId(id))
		//	{
		//		list.Add(new SelectListItem { Text = skill.SkillName, Value = skill.SkillID.ToString() });

		//	}
		//	return list;
		//}
		//private List<SelectListItem> GetDepartments(List<Department> departments)
		//{
		//	List<SelectListItem> list = new List<SelectListItem>();

		//	foreach (var department in departments)
		//	{
		//		list.Add(new SelectListItem() { Text = department.DepartmentName, Value = department.DepartmentID.ToString() });
		//	}
		//	return list;
		//}

	}
}
