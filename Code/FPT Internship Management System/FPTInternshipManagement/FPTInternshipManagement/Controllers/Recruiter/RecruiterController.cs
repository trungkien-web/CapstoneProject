using Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Repository.Common;
using Model;
using Service;
using FPTInternshipManagement.Models;

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
            IRecruiterService recruiterService = new RecruiterService();
            List<StudentModel> listStudent = new List<StudentModel>();
            int stt = 0;
            recruiterService.searchStudents("", "", "", "", "").ForEach(student => {
                StudentModel st = new StudentModel();
                st.no = stt++;
                st.name = student.Name;
                st.code = student.UserID.ToString();
                st.email = student.Email;
                st.phoneNumb = student.Phone.ToString();
                st.specialized = "Bố thiên hạ";
                st.course = "9";
                st.cv = student.CV;
                st.status = student.Status;
                listStudent.Add(st);
            });
            return View(listStudent);
		}
	}
}