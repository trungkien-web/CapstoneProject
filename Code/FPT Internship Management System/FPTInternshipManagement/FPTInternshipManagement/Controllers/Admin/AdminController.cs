
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
using System.Security.Cryptography;
using System.Text;
using PagedList;
using OfficeOpenXml;
using System.Data;
using LinqToExcel;
using System.Data.OleDb;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.IO;

namespace FPTInternshipManagement.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        // GET: Admin

        IImageService imgService = new ImageService();
        FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
        ILocationService locationService = new LocationService();
        public ActionResult Index()
        {
            ViewBag.CountStudent = (from user in ctx.Users
                                    join userrole in ctx.UserRoles
                                    on user.UserID equals userrole.UserID
                                    where userrole.RoleID == 2
                                    select user).ToList().Count();
            ViewBag.CountRecruiter = (from user in ctx.Users
                                    join userrole in ctx.UserRoles
                                    on user.UserID equals userrole.UserID
                                    where userrole.RoleID == 3
                                    select user).ToList().Count();
            ViewBag.Report = ctx.Reports.ToList().Count();
            ViewBag.FeedBack = ctx.Feedbacks.ToList().Count();
            ViewBag.UserDangThucTap = ctx.UserJobs.Where(x => x.Status == "Activated").ToList().Count();
            ViewBag.AspRecruiter = (from asp in ctx.Aspirations
                                    join userasp in ctx.UserAspirations
                                    on asp.AspirationsID equals userasp.AspirationsID
                                    join user in ctx.Users
                                    on userasp.UserID equals user.UserID
                                    join userrole in ctx.UserRoles
                                    on user.UserID equals userrole.UserID
                                    where userrole.RoleID == 3
                                    select user).ToList().Count();
            ViewBag.Notify = ctx.Notifications.ToList();
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
        public ActionResult AccountSearch(string keyword, int role)
        {
            var result = (from u in ctx.Users
                          join ul in ctx.UserRoles
                          on u.UserID equals ul.UserID
                          where ul.RoleID == role
                          && u.Status != "Delete"
                          && u.Status != "Reject"
                          select u).ToList();
            if (!string.IsNullOrEmpty(keyword))
            {
                result = result.Where(x => x.Name.Contains(keyword) || x.Username.Contains(keyword)).ToList();
            }
            foreach (var item in result)
            {
                var roles = ctx.UserRoles.Where(x => x.UserID == item.UserID).FirstOrDefault().RoleID;
                item.Description = roles.ToString();

            }
            ViewBag.User = result;

            return PartialView();
        }

        [HttpPost]
        public bool Accept(int UserId)
        {
            var User = ctx.Users.Where(x => x.UserID == UserId).FirstOrDefault();
            User.Status = "Activated";
            ctx.SaveChanges();
            
            var role = ctx.UserRoles.Where(x => x.UserID == User.UserID).FirstOrDefault();
            if (role.RoleID == 3)
            {
                var mailbody = "<p>Thông báo tài khoản đã được kích hoạt</p>";
                mailbody += "<p>Dear " + User.Name + ",<p>";
                mailbody += "<p>Chào mừng bạn đã đến với FSIMS, đây là mail tự động chúng tôi xin gửi account " +
                    "và password để các bạn đăng nhập vào hệ thống sau khi đăng nhập các bạn hãy đổi password để được bảo mật tốt nhất:<p/>";
                mailbody += "<p>Username : "+ User.Username+"<p>";
                mailbody += "<p>Password : "+User.Name+ "@123" + "</p>";
                SendGmail("fptinternshipsystem@gmail.com", "123@123a", User.Email , mailbody);

            }

            return true;
        }


        public void SendGmail(string from, string password, string to, string body)
        {
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Timeout = 100000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(from, password);
                MailMessage mail = new MailMessage(from, to, "Thông báo kích hoạt tài khoản thành công", body);
                mail.IsBodyHtml = true;
                mail.BodyEncoding = UTF8Encoding.UTF8;
                client.Send(mail);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        [HttpPost]
        public bool Reject(int UserId)
        {
            var User = ctx.Users.Where(x => x.UserID == UserId).FirstOrDefault();
            User.Status = "Reject";
            ctx.SaveChanges();
            return true;
        }


        [HttpPost]
        public bool Delete(int UserId)
        {
            var User = ctx.Users.Where(x => x.UserID == UserId).FirstOrDefault();
            User.Status = "Delete";
            ctx.SaveChanges();
            return true;
        }

        [HttpPost]
        public bool AddNew(string Name, string UserName, string Password, string Email, int Location,  int RoleAdd)
        {
            var User = new User();
            User.Name = Name;
            User.Username = UserName;
            User.Password = MD5Gende(Password);
            User.Email = Email;
            //User.Phone = Phone;
           
            User.LocationID = Location;
          
            User.Status = "Activated";
            ctx.Users.Add(User);
            ctx.SaveChanges();
            var id = User.UserID;


            var UserRole = new UserRole();
            UserRole.UserID = id;
            UserRole.RoleID = RoleAdd;
            ctx.UserRoles.Add(UserRole);
            ctx.SaveChanges();
            return true;
        }


        
        public string MD5Gende(string password)
        {
            MD5 mh = MD5.Create();
            //Chuyển kiểu chuổi thành kiểu byte
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(password);
            //mã hóa chuỗi đã chuyển
            byte[] hash = mh.ComputeHash(inputBytes);
            //tạo đối tượng StringBuilder (làm việc với kiểu dữ liệu lớn)
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }

        public PartialViewResult ReportData(int recruiterid)
        {
            var lsta = ctx.Jobs.Where(x => x.RecruiterID == recruiterid).ToList();
            var lstuserjob = new List<UserJob>();
            var lstuser = new List<User>();
            foreach (var item in lsta)
            {
                var lsbb = ctx.UserJobs.Where(x => x.JobID == item.JobID).ToList();
                if (lsbb != null)
                {
                    foreach (var item2 in lsbb)
                    {
                        lstuserjob.Add(item2);
                    }
                }
            }

            if (lstuserjob != null)
            {
                foreach (var item in lstuserjob)
                {
                    var bj = ctx.Users.Where(x => x.UserID == item.UserID).FirstOrDefault();
                    if (bj != null)
                    {
                        lstuser.Add(bj);
                    }
                }
            }


            return PartialView();
        }

       

        public void DownloadExcelAccount()
        {
            var result = (from u in ctx.Users
                          join ul in ctx.UserRoles
                          on u.UserID equals ul.UserID
                          where u.Status != "Delete"
                          && u.Status != "Reject"
                          select u).ToList();

            foreach (var item in result)
            {
                var roles = ctx.UserRoles.Where(x => x.UserID == item.UserID).FirstOrDefault().RoleID;
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
            int row = 2;
            foreach (var item in result)
            {

                Sheet.Cells[string.Format("A{0}", row)].Value = item.Name;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.UserID;
                Sheet.Cells[string.Format("C{0}", row)].Value = item.Email;
                Sheet.Cells[string.Format("D{0}", row)].Value = item.Phone;
                Sheet.Cells[string.Format("E{0}", row)].Value = item.Status;
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
                if (dt != null)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["Username"].ToString() != "" && dt.Rows[i]["Password"].ToString() != "")
                        {
                            User TU = new User();
                            TU.Name = dt.Rows[i]["Name"].ToString();
                            TU.Username = dt.Rows[i]["Username"].ToString();
                            TU.Password = dt.Rows[i]["Password"].ToString();
                            TU.Phone = Convert.ToInt32(dt.Rows[i]["Phone"]);
                            TU.Gender = Convert.ToBoolean(dt.Rows[i]["Gender"]);
                            TU.Email = dt.Rows[i]["Email"].ToString();
                            TU.LocationID = Convert.ToInt32(dt.Rows[i]["LocationID"]);
                            TU.Description = dt.Rows[i]["Description"].ToString();
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
            }

            ExcelPackage Ep = new ExcelPackage();
            ExcelWorksheet Sheet = Ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "Recruiter Name";
            Sheet.Cells["B1"].Value = "Student Name";
            Sheet.Cells["C1"].Value = "Course";
            Sheet.Cells["D1"].Value = "Grade";
            Sheet.Cells["E1"].Value = "Comment";

            int row = 2;
            foreach (var item in lstReport)
            {

                Sheet.Cells[string.Format("A{0}", row)].Value = item.recruitername;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.studentname;
                Sheet.Cells[string.Format("C{0}", row)].Value = item.Course;
                Sheet.Cells[string.Format("D{0}", row)].Value = item.Grade;
                Sheet.Cells[string.Format("E{0}", row)].Value = item.Comment;
                row++;
            }


            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment: filename=" + "Report.xlsx");
            Response.BinaryWrite(Ep.GetAsByteArray());
            Response.End();
        }

        //Phan quyen Admin
        [Authorize(Roles = "Admin1")]
        public class AdminController : Controller
        {
            // GET: Admin

            IImageService imgService = new ImageService();
            FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
            ILocationService locationService = new LocationService();
            public ActionResult Index()
            {
                ViewBag.CountStudent = (from user in ctx.Users
                                        join userrole in ctx.UserRoles
                                        on user.UserID equals userrole.UserID
                                        where userrole.RoleID == 2
                                        select user).ToList().Count();
                ViewBag.CountRecruiter = (from user in ctx.Users
                                          join userrole in ctx.UserRoles
                                          on user.UserID equals userrole.UserID
                                          where userrole.RoleID == 3
                                          select user).ToList().Count();
                ViewBag.Report = ctx.Reports.ToList().Count();
                ViewBag.FeedBack = ctx.Feedbacks.ToList().Count();
                ViewBag.UserDangThucTap = ctx.UserJobs.Where(x => x.Status == "Activated").ToList().Count();
                ViewBag.AspRecruiter = (from asp in ctx.Aspirations
                                        join userasp in ctx.UserAspirations
                                        on asp.AspirationsID equals userasp.AspirationsID
                                        join user in ctx.Users
                                        on userasp.UserID equals user.UserID
                                        join userrole in ctx.UserRoles
                                        on user.UserID equals userrole.UserID
                                        where userrole.RoleID == 3
                                        select user).ToList().Count();
                ViewBag.Notify = ctx.Notifications.ToList();
                return View();
            }
        }
}
