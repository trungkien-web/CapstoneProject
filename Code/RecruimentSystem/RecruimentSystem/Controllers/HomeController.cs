using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;

namespace RecruimentSystem.Controllers
{
    public class HomeController : Controller
    {
        private IDepartmentService service = new DepartmentService();
        // GET: Home
        public ActionResult Index()
        {
            var department =  service.GetAllDepartments();
            return View(department);
        }
    }
}