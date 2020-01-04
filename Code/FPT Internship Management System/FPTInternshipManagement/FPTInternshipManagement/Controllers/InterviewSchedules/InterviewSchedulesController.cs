using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using MyCalendar.Models;

namespace FPTInternshipManagement.Controllers
{
    public class InterviewSchedulesController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetEvents()
        {
            using (FPTInternshipManagermentEntities dc = new FPTInternshipManagermentEntities())
            {
                var events = dc.InterviewSchedules.ToList();
                return new JsonResult { Data = events, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
        }

        [HttpPost]
        public JsonResult SaveEvent(InterviewSchedule e)
        {
            var status = false;
            using (FPTInternshipManagermentEntities dc = new FPTInternshipManagermentEntities())
            {
                if (e.InterviewID > 0)
                {
                    //Update the event
                    var v = dc.InterviewSchedules.Where(a => a.InterviewID == e.InterviewID).FirstOrDefault();
                    if (v != null)
                    {
                        v.Subject = e.Subject;
                        v.Location = e.Location;
                        v.LocationID = e.LocationID;
                        v.RecruiterID = e.RecruiterID;
                        v.StudentID = e.StudentID;
                        v.StartTime = e.StartTime;
                        v.EndTime = e.EndTime;
                        v.Status = e.Status;
                        
                    }
                }
                else
                {
                    dc.InterviewSchedules.Add(e);
                }

                dc.SaveChanges();
                status = true;

            }
            return new JsonResult { Data = new { status = status } };
        }

        [HttpPost]
        public JsonResult DeleteEvent(int eventID)
        {
            var status = false;
            using (FPTInternshipManagermentEntities dc = new FPTInternshipManagermentEntities())
            {
                var v = dc.InterviewSchedules.Where(a => a.InterviewID == eventID).FirstOrDefault();
                if (v != null)
                {
                    dc.InterviewSchedules.Remove(v);
                    dc.SaveChanges();
                    status = true;
                }
            }
            return new JsonResult { Data = new { status = status } };
        }
    
}
}