using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using Service;

namespace FPTInternshipManagement.Controllers.Recruiter
{
    public class PublishedRecruitmentController : Controller
    {
        IDepartmentService departmentService = new DepartmentService();
        // GET: PublishedRecruitment
        public ActionResult Index()
        {

            return View();
        }

        // POST: PublishedRecruitment/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public JsonResult GetAllDepartment()
        {
            List<SelectListItem> departmentSelectList = new List<SelectListItem>();
            Department department = new Department();

            foreach (var depart in departmentService.GetAllDepartments())
            {
                departmentSelectList.Add(new SelectListItem
                {
                    Value = Convert.ToString(depart.DepartmentID),
                    Text = depart.DepartmentName
                });
            }

            return Json(departmentSelectList, JsonRequestBehavior.AllowGet);
        }


    }
}
