using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;

namespace RecruimentSystem.Controllers
{
    public class CommonController : Controller
    {
        private ICommonService service = new CommonService();
        // GET: Common
        public ActionResult Index()
        {
            var DataTable = service.GetAllNameTable();
            ViewBag.NameTable = DataTable;
            return View(DataTable);
        }

        // GET: Common/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Common/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Common/Create
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

        // GET: Common/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Common/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Common/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Common/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
