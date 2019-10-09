using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Model;
using RecruimentSystem.Models;

namespace RecruimentSystem.Controllers
{
    public class HomeController : Controller
    {
        private IDepartmentService service = new DepartmentService();
        // GET: Home
        public ActionResult Index()
        {
            var department =  service.GetAllDepartments();
			var skillKeyValuePair = service.GetToDictionary();
			IndexVM model = new IndexVM();
			model.departments = new List<Department>();
			model.skillKeyValuePair = new Dictionary<int, List<Skill>>();
			model.departments = department;
			model.skillKeyValuePair = skillKeyValuePair;
			return View(model);
        }
	}
}