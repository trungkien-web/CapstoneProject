
using FPTInternshipManagement.Common;
using Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Repository.Common;
using Service;
using Model;
using PagedList;
using OfficeOpenXml;
using System.Data.OleDb;
using LinqToExcel;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace FPTInternshipManagement.Controllers.Admin
{
    [Authorize(Roles = "Staff")]
    public class StaffController : Controller
    {
        // GET: Admin

        IImageService imgService = new ImageService();
        FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
        ILocationService locationService = new LocationService();
        public ActionResult Index()
        {
            return View();
        }

        // GET: Admin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Create
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

        // GET: Admin/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/Edit/5
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

        // GET: Admin/Delete/5

        // POST: Admin/Delete/5

        public ActionResult AccountManagement()
        {
            ViewBag.Location = locationService.GetAllLocation();
            return View();
        }


        [HttpPost]
        public ActionResult AccountSearch(string keyword, string location)
        {
            var result = (from u in ctx.Users
                          join ul in ctx.UserRoles
                          on u.UserID equals ul.UserID
                          join loca in ctx.Locations
                          on u.LocationID equals loca.LocationID
                          where ul.RoleID == 3
                          && u.Status != "Delete"
                          select u).ToList();
            if (!string.IsNullOrEmpty(keyword))
            {
                result = result.Where(x => x.Name.Contains(keyword) || x.Username.Contains(keyword)).ToList();
            }
            if (location != "All")
            {
                result = result.Where(x => x.LocationID != null).ToList();
                result = result.Where(x => x.LocationID == int.Parse(location)).ToList();
            }
            foreach (var item in result)
            {
                var roles = ctx.UserRoles.Where(x => x.UserID == item.UserID).FirstOrDefault().RoleID;
                item.Description = roles.ToString();

            }
            ViewBag.User = result;


            return PartialView();
        }


        public ActionResult AccountManagementStudent()
        {
            ViewBag.Location = locationService.GetAllLocation();
            return View();
        }


        [HttpPost]
        public ActionResult AccountSearchStudent(string keyword, string semester)
        {
            var result = (from u in ctx.Users
                          join ul in ctx.UserRoles
                          on u.UserID equals ul.UserID
                          where ul.RoleID == 2
                          && u.Status != "Delete"
                          select u).ToList();
            if (!string.IsNullOrEmpty(keyword))
            {
                result = result.Where(x => x.Name.Contains(keyword) || x.Username.Contains(keyword)).ToList();
            }
            if (semester != "All")
            {
                result = result.Where(x => x.Semester != null).ToList();
                result = result.Where(x => x.Semester.Contains(semester)).ToList();
            }
            foreach (var item in result)
            {
                var roles = ctx.UserRoles.Where(x => x.UserID == item.UserID).FirstOrDefault().RoleID;
                item.Description = roles.ToString();
                var statusTT = ctx.UserJobs.Where(x => x.UserID == item.UserID && x.Status == "Activated").FirstOrDefault();
                if (statusTT != null)
                {
                    item.Password = "is intern";
                }
                else
                {
                    item.Password = "is not intern";
                }

            }

            var img = "~/Assets/images/no-img.png";
            foreach (var item in result)
            {
                if (item.ImageID == null)
                {
                    item.Username = img;
                }
                else
                {
                    var imgnew = ctx.Images.Where(x => x.ImageID == item.ImageID).FirstOrDefault();
                    item.Username = imgnew.Path;
                }

            }
            ViewBag.User = result;

            return PartialView();
        }

        // Manager Asp
        public ActionResult MyAspiration()
        {
            var userId = SessionHelper.GetSession().UserID;
            var lstUserAsp = (from userasp in ctx.UserAspirations
                              join userb in ctx.Users on userasp.UserID equals userb.UserID
                              join userr in ctx.UserRoles on userb.UserID equals userr.UserID
                              where userr.RoleID == 3
                              select userasp).ToList();
            var lstAps = new List<Aspiration>();
            foreach (var item in lstUserAsp)
            {
                var obj = ctx.Aspirations.Where(x => x.AspirationsID == item.AspirationsID).FirstOrDefault();
                lstAps.Add(obj);
            }

            //reload data 
            ctx.SaveChanges();

            foreach (var item in lstAps)
            {
                var nameskil = "";
                var apsjoin = ctx.AspirationSkills.ToList();
                var userasp = ctx.UserAspirations.Where(x => x.AspirationsID == item.AspirationsID).FirstOrDefault();
                item.RecruiterName = ctx.Users.Where(x => x.UserID == userasp.UserID).FirstOrDefault().Name;
                foreach (var itemjoin in apsjoin)
                {
                    var job = ctx.Jobs.Where(x => x.JobID == itemjoin.SkillID).FirstOrDefault();
                    if (job != null)
                    {
                        var jobname = job.JobName;
                        nameskil = nameskil + "<li style='width: 100%;margin: 3px 5px;border: 1px solid #ccc;padding: 3px 8px;font-size: 13px;letter-spacing: 1px;text-transform: uppercase;color: #777;'>" + jobname + "</li>";

                    }
                }

                //reload data 
                ctx.SaveChanges();

                item.Description = nameskil;


            }


            ViewBag.Asp = lstAps.ToList();

            return View();
        }

        [HttpPost]
        public JsonResult GetAspiration(int id)
        {
            var userId = SessionHelper.GetSession().UserID;
            ctx.Configuration.ProxyCreationEnabled = false;
            var obj = ctx.Aspirations.Where(x => x.AspirationsID == id).FirstOrDefault();
            List<int> lstskill = new List<int>();
            var apsjoin = ctx.AspirationSkills.Where(x => x.AspirationID == id).ToList();
            foreach (var itemjoin in apsjoin)
            {
                var skill = ctx.Jobs.Where(x => x.JobID == itemjoin.SkillID).FirstOrDefault().JobID;

                lstskill.Add(skill);
            }

            var data = new { id = obj.AspirationsID, des = obj.Description, name = obj.AspirationsName, skill = lstskill };
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public bool DelAspiration(int Id)
        {

            var lstAspEx = ctx.AspirationSkills.Where(x => x.AspirationID == Id).ToList();
            foreach (var item in lstAspEx)
            {
                ctx.AspirationSkills.Remove(item);
            }
            ctx.SaveChanges();

            var lstAspUser = ctx.UserAspirations.Where(x => x.AspirationsID == Id).ToList();
            foreach (var item in lstAspUser)
            {
                ctx.UserAspirations.Remove(item);
            }
            ctx.SaveChanges();

            var lstAsp = ctx.Aspirations.Where(x => x.AspirationsID == Id).FirstOrDefault();
            ctx.Aspirations.Remove(lstAsp);
            ctx.SaveChanges();
            return true;
        }


        [HttpPost]
        public bool AcceptAspiration(int Id)
        {
            var lstAspEx = ctx.Aspirations.Where(x => x.AspirationsID == Id).FirstOrDefault();
            lstAspEx.Status = "Approve";
            ctx.SaveChanges();
            return true;
        }



        [HttpPost]
        public bool SaveAspiration(string Des, string Skill, string Name)
        {
            var newobj = new Aspiration(); // add vao table Asp
            newobj.Description = Des;
            newobj.AspirationsName = Name;
            ctx.Aspirations.Add(newobj);
            ctx.SaveChanges();

            var id = newobj.AspirationsID; //id Asp return

            var UserAsp = new UserAspiration();
            UserAsp.AspirationsID = id;
            UserAsp.UserID = SessionHelper.GetSession().UserID;
            ctx.UserAspirations.Add(UserAsp);
            ctx.SaveChanges();

            var lstskill = Skill.Split(',');
            foreach (var item in lstskill) // add vao tale AspSkill
            {
                var newAspSkill = new AspirationSkill();
                newAspSkill.AspirationID = id;
                newAspSkill.SkillID = int.Parse(item);
                ctx.AspirationSkills.Add(newAspSkill);
                ctx.SaveChanges();
            }


            return true;

        }

        [HttpPost]
        public bool SaveEditAspiration(int Id, string Des, string Skill, string Name)
        {
            var newobj = ctx.Aspirations.Where(x => x.AspirationsID == Id).FirstOrDefault(); // get Asp
            newobj.Description = Des;
            newobj.AspirationsName = Name;
            ctx.SaveChanges();


            var lstapskill = ctx.AspirationSkills.Where(x => x.AspirationID == Id).ToList();
            foreach (var item in lstapskill)
            {
                ctx.AspirationSkills.Remove(item);
            }

            var lstskill = Skill.Split(',');
            foreach (var item in lstskill) // add vao tale AspSkill
            {
                var newAspSkill = new AspirationSkill();
                newAspSkill.AspirationID = Id;
                newAspSkill.SkillID = int.Parse(item);
                ctx.AspirationSkills.Add(newAspSkill);
                ctx.SaveChanges();
            }


            return true;

        }
        public static List<Notification> lstNotify = new List<Notification>()
        {

        };

        public ActionResult MyNotify()
        {
            lstNotify = ctx.Notifications.ToList();
            return View();
        }

        public PartialViewResult GetpaingNotify(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return PartialView("PartialNotify", lstNotify.ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        public Boolean SaveNot(string Des)
        {
            var obj = new Notification();
            obj.Content = Des;
            obj.RecruiterID = 1;
            obj.StudentID = 1;
            ctx.Notifications.Add(obj);
            ctx.SaveChanges();
            return true;
        }

        [HttpPost]
        public Boolean DelNot(int Id)
        {
            var obj = ctx.Notifications.Where(x => x.NotificationID == Id).FirstOrDefault();
            ctx.Notifications.Remove(obj);
            ctx.SaveChanges();
            return true;
        }

        [HttpPost]
        public string ViewNot(int Id)
        {
            var obj = ctx.Notifications.Where(x => x.NotificationID == Id).FirstOrDefault();
            return obj.Content;
        }

        public static List<Models.FeedBackModel> lstFB = new List<Models.FeedBackModel>()
        {

        };

        public ActionResult GetFeedBack()
        {
            lstFB = new List<Models.FeedBackModel>();
            var lstFB2 = ctx.Feedbacks.ToList();
            foreach (var item in lstFB2)
            {
                if (item.FeedbackTypeID == 1) //nhà trường fb sinh viên
                {
                    var obj = new Models.FeedBackModel();
                    obj.content = item.Content;
                    obj.Name1 = "Recruter: " + ctx.Users.Where(x => x.UserID == item.RecruiterID).FirstOrDefault().Name;
                    obj.Name2 = "Student: " + ctx.Users.Where(x => x.UserID == item.StudentID).FirstOrDefault().Name;
                    lstFB.Add(obj);
                }
                else //sinh viên fb nhà trường
                {
                    var obj = new Models.FeedBackModel();
                    obj.content = item.Content;
                    obj.Name2 = "Recruter: " + ctx.Users.Where(x => x.UserID == item.RecruiterID).FirstOrDefault().Name;
                    obj.Name1 = "Student: " + ctx.Users.Where(x => x.UserID == item.StudentID).FirstOrDefault().Name;
                    lstFB.Add(obj);
                }

            }
            return View();
        }

        public PartialViewResult GetpaingFB(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return PartialView("PartialFB", lstFB.ToPagedList(pageNumber, pageSize));
        }

        public void DownloadExcel()
        {

            ExcelPackage Ep = new ExcelPackage();
            ExcelWorksheet Sheet = Ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "From";
            Sheet.Cells["B1"].Value = "FeedbackTo";
            Sheet.Cells["C1"].Value = "Content";
            int row = 2;
            foreach (var item in lstFB)
            {

                Sheet.Cells[string.Format("A{0}", row)].Value = item.Name1;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.Name2;
                Sheet.Cells[string.Format("C{0}", row)].Value = item.content;
                row++;
            }


            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment: filename=" + "Report.xlsx");
            Response.BinaryWrite(Ep.GetAsByteArray());
            Response.End();
        }

        public void DownloadExcelAccount()
        {
            var result = (from u in ctx.Users
                          join ul in ctx.UserRoles
                          on u.UserID equals ul.UserID
                          where u.Status != "Delete"
                          && u.Status != "Reject"
                          && ul.RoleID == 2
                          select u).ToList();

            foreach (var item in result)
            {
                var roles = ctx.UserRoles.Where(x => x.UserID == item.UserID ).FirstOrDefault().RoleID;
                item.Description = roles.ToString();

            }
            ViewBag.User = result;
            ExcelPackage Ep = new ExcelPackage();
            ExcelWorksheet Sheet = Ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "Name";
            Sheet.Cells["B1"].Value = "Code";
            Sheet.Cells["C1"].Value = "Email";
            Sheet.Cells["D1"].Value = "Phone";
            Sheet.Cells["E1"].Value = "Status";
            Sheet.Cells["F1"].Value = "GPA";
            Sheet.Cells["G1"].Value = "Semester";
            int row = 2;
            foreach (var item in result)
            {
                
                Sheet.Cells[string.Format("A{0}", row)].Value = item.Name;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.Code;
                Sheet.Cells[string.Format("C{0}", row)].Value = item.Email;
                Sheet.Cells[string.Format("D{0}", row)].Value = item.Phone;
                Sheet.Cells[string.Format("E{0}", row)].Value = item.Status;
                Sheet.Cells[string.Format("F{0}", row)].Value = item.GPA;
                Sheet.Cells[string.Format("G{0}", row)].Value = item.Semester;
                row++;
            }


            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment: filename=" + "Report.xlsx");
            Response.BinaryWrite(Ep.GetAsByteArray());
            Response.End();
        }

        [HttpPost]
        public ActionResult ImportExcel(HttpPostedFileBase postedFile)
        {
            string filePath = string.Empty;
            if (postedFile != null)
            {
                string path = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                filePath = path + Path.GetFileName(postedFile.FileName);
                string extension = Path.GetExtension(postedFile.FileName);
                postedFile.SaveAs(filePath);

                string conString = string.Empty;
                switch (extension)
                {
                    case ".xls": //Excel 97-03.
                        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                        break;
                    case ".xlsx": //Excel 07 and above.
                        conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                        break;
                }

                DataTable dt = new DataTable();
                conString = string.Format(conString, filePath);
                string sheetName;
                using (OleDbConnection connExcel = new OleDbConnection(conString))
                {
                    using (OleDbCommand cmdExcel = new OleDbCommand())
                    {
                        using (OleDbDataAdapter odaExcel = new OleDbDataAdapter())
                        {
                            cmdExcel.Connection = connExcel;
                            //Get the name of First Sheet.
                            connExcel.Open();
                            DataTable dtExcelSchema;
                            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                            sheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
                            connExcel.Close();

                            //Read Data from First Sheet.
                            connExcel.Open();
                            cmdExcel.CommandText = "SELECT * From [" + sheetName + "]";
                            odaExcel.SelectCommand = cmdExcel;
                            odaExcel.Fill(dt);
                            connExcel.Close();
                        }
                    }
                }
                sheetName = sheetName.Remove(sheetName.Trim().Length - 1);
                if(dt != null)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["Username"].ToString() != "" && dt.Rows[i]["Password"].ToString() != "")
                        {
                            User TU = new User();
                            TU.Name = dt.Rows[i]["Name"].ToString();
                            TU.Code = dt.Rows[i]["Code"].ToString();
                            TU.Username = dt.Rows[i]["Username"].ToString();
                            TU.Password = dt.Rows[i]["Password"].ToString();
                            if (dt.Rows[i]["Phone"].ToString() != "")
                            { 
                                TU.Phone = Convert.ToInt32(dt.Rows[i]["Phone"]);
                            }
                            TU.Gender = Convert.ToBoolean(dt.Rows[i]["Gender"]);
                            TU.Email = dt.Rows[i]["Email"].ToString();
                            if (dt.Rows[i]["LocationID"].ToString() != "")
                            {
                                TU.LocationID = Convert.ToInt32(dt.Rows[i]["LocationID"]);
                            }
                            TU.Description = dt.Rows[i]["Description"].ToString();
                            TU.Specialized = dt.Rows[i]["Specialized"].ToString();
                            TU.GPA = dt.Rows[i]["GPA"].ToString();
                            if (dt.Rows[i]["DOB"].ToString() != "")
                            {
                                TU.DOB = Convert.ToDateTime(dt.Rows[i]["DOB"]);
                            }
                            TU.CreateDate = Convert.ToDateTime(dt.Rows[i]["CreateDate"]);
                            if(dt.Rows[i]["ImageID"].ToString() != "" )
                            {
                                TU.ImageID = Convert.ToInt32(dt.Rows[i]["ImageID"]);
                            }
                            TU.Status = "Activated";
                            TU.Semester = dt.Rows[i]["Semester"].ToString();
                            ctx.Users.Add(TU);
                            ctx.SaveChanges();
                            UserRole userRole = new UserRole();
                            userRole.UserID = TU.UserID;
                            userRole.RoleID = 2;
                            ctx = new FPTInternshipManagermentEntities();
                            ctx.UserRoles.Add(userRole);
                            ctx.SaveChanges();
                        }
                    }
                }
                

            }
            return RedirectToAction("AccountManagementStudent");
        }



        public ActionResult ReportView()
        {
            var lstReport = ctx.Reports.ToList();
            foreach (var item in lstReport)
            {
                item.recruitername = ctx.Users.Where(x => x.UserID == item.RecruiterID).FirstOrDefault().Name;
                item.studentname = ctx.Users.Where(x => x.UserID == item.StudentID).FirstOrDefault().Name;
                item.studentcode = ctx.Users.Where(x => x.UserID == item.StudentID).FirstOrDefault().Code;

            }
            ViewBag.Data = lstReport;
            return View();
        }

        public void DownloadExcelReport()
        {
            var lstReport = ctx.Reports.ToList();
            foreach (var item in lstReport)
            {
                item.recruitername = ctx.Users.Where(x => x.UserID == item.RecruiterID).FirstOrDefault().Name;
                item.studentname = ctx.Users.Where(x => x.UserID == item.StudentID).FirstOrDefault().Name;
                item.studentcode = ctx.Users.Where(x => x.UserID == item.StudentID).FirstOrDefault().Code;
            }

            ExcelPackage Ep = new ExcelPackage();
            ExcelWorksheet Sheet = Ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "Recruiter Name";
            Sheet.Cells["B1"].Value = "Student Name";
            Sheet.Cells["C1"].Value = "Student Code";
            Sheet.Cells["D1"].Value = "Course";
            Sheet.Cells["E1"].Value = "Grade";
            Sheet.Cells["F1"].Value = "Comment";

            int row = 2;
            foreach (var item in lstReport)
            {

                Sheet.Cells[string.Format("A{0}", row)].Value = item.recruitername;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.studentname;
                Sheet.Cells[string.Format("C{0}", row)].Value = item.studentcode;
                Sheet.Cells[string.Format("D{0}", row)].Value = item.Course;
                Sheet.Cells[string.Format("E{0}", row)].Value = item.Grade;
                Sheet.Cells[string.Format("F{0}", row)].Value = item.Comment;
                row++;
            }


            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment: filename=" + "Report.xlsx");
            Response.BinaryWrite(Ep.GetAsByteArray());
            Response.End();
        }

        public ActionResult GetFeedBackByAdmin()
        {
            lstFB = new List<Models.FeedBackModel>();
            var lstFB2 = ctx.Feedbacks.ToList();
            foreach (var item in lstFB2)
            {
                if (item.FeedbackTypeID == 1) //nhà trường fb sinh viên
                {
                    var obj = new Models.FeedBackModel();
                    obj.content = item.Content;
                    obj.Name1 = "Recruter: " + ctx.Users.Where(x => x.UserID == item.RecruiterID).FirstOrDefault().Name;
                    obj.Name2 = "Student: " + ctx.Users.Where(x => x.UserID == item.StudentID).FirstOrDefault().Name;
                    lstFB.Add(obj);
                }
                else //sinh viên fb nhà trường
                {
                    var obj = new Models.FeedBackModel();
                    obj.content = item.Content;
                    obj.Name2 = "Recruter: " + ctx.Users.Where(x => x.UserID == item.RecruiterID).FirstOrDefault().Name;
                    obj.Name1 = "Student: " + ctx.Users.Where(x => x.UserID == item.StudentID).FirstOrDefault().Name;
                    lstFB.Add(obj);
                }

            }
            return View();
        }

    }

}

