using FPTInternshipManagement.Common;
using FPTInternshipManagement.Models;
using Helper;
using Model;
using Newtonsoft.Json;
using Repository.Common;
using Service;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Controllers.Student
{

    [Authorize(Roles = "Student")]
    public class StudentController : Controller
    {
        ISkillService skillService = new SkillService();
        IUserService useService = new UserService();
        IImageService imgService = new ImageService();
        ILocationService locationService = new LocationService();
        IDepartmentService departmentService = new DepartmentService();
        IStudentAspirationService studentAspirationService = new StudentAspirationService();
        FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
        // GET: Student

        public ActionResult Index()
        {
            return View();
        }



        public ActionResult MyProfile()
        {
            var userId = SessionHelper.GetSession().UserID;//UserID
            var studentInfor = useService.GetUserById(userId);
            var img = "../../Assets/images/no-img.png";
            if (studentInfor.ImageID != null)
            {
                img = imgService.GetImageById(studentInfor.ImageID.GetValueOrDefault()).Path;
                img = img.Substring(1);
            }


            ViewBag.Image = img;
            ViewBag.Mail = studentInfor.Email;
            ViewBag.userID = userId;
            ViewBag.Name = studentInfor.Name;
            ViewBag.CV = studentInfor.CV;
            ViewBag.Address = studentInfor.LocationID.GetValueOrDefault();
            ViewBag.Location = locationService.GetAllLocation();
            ViewBag.Skills = skillService.GetAllSkills();


            var userlogged = (UserSession)SessionHelper.GetSession();
            var lstExp = from u in ctx.Users
                         join Ex in ctx.Experiences
                         on u.UserID equals Ex.UserID
                         join skill in ctx.Skills
                             on Ex.SkillID equals skill.SkillID
                         where u.UserID == userlogged.UserID
                         select new ExViewModel()
                         {
                             IdEx = Ex.ExperienceID,
                             skill = skill.SkillName,
                             Des = Ex.Description,
                         };

            ViewBag.Exp = lstExp.ToList();
            //List<Department> departments = departmentService.GetAllDepartments();
            //StudentViewModel model = new StudentViewModel();
            //	string selected = departments.ElementAt(0).DepartmentID.ToString();
            //         model.AvailableSkills = new List<SelectListItem>(GetSkills(Int32.Parse(selected)));
            //model.GetAllDepartment = departments;
            //model.SelectListItems = GetDepartments(departments);

            ViewBag.lstNot = ctx.Notifications.Take(8).ToList();


            return View(studentInfor);
        }

        [HttpPost]
        public ActionResult MyProfile(FormCollection fc, HttpPostedFileBase file, HttpPostedFileBase fileimage)
        {
            var UserID = int.Parse(fc["Id"].ToString());
            User user = ctx.Users.Where(x => x.UserID == UserID).FirstOrDefault();
            user.Name = fc["Name"].ToString();
            //tbl.Image_url = file.ToString(); //getting complete url  
            user.LocationID = int.Parse(fc["location"]);


            if (file != null)
            {
                var fileName = Path.GetFileName(file.FileName); //getting only file name(ex-ganesh.jpg)  
                var ext = Path.GetExtension(file.FileName); //getting the extension(ex-.jpg)  
                string name = Path.GetFileNameWithoutExtension(fileName);
                var path = Path.Combine(Server.MapPath("~/Assets/upload/"), fileName);
                user.CV = fileName;
                file.SaveAs(path);
            }

			if (fileimage != null)
			{
				var fileName = Path.GetFileName(fileimage.FileName); //getting only file name(ex-ganesh.jpg)  
				var ext = Path.GetExtension(fileimage.FileName); //getting the extension(ex-.jpg)  
				string name = Path.GetFileNameWithoutExtension(fileName);
				var path = Path.Combine(Server.MapPath("~/Assets/images/"), fileName);

				var img = ctx.Images.Where(x => x.ImageID == user.ImageID).FirstOrDefault();
				if (img !=null)
				{
					img.Path = "~/Assets/images/" + fileName;
				}
				else
				{
					var newimg = new Image();
					newimg.Path = "~/Assets/images/" + fileName;
					newimg.Name = name;
					ctx.Images.Add(newimg);
					ctx.SaveChanges();

					var idimg = newimg.ImageID;
					user.ImageID = idimg;
				}
				
				fileimage.SaveAs(path);
			}
			ctx.SaveChanges();
            return RedirectToAction("MyProfile");

        }



        public ActionResult MySkill()
        {
            var userlogged = (UserSession)SessionHelper.GetSession();
            var lstExp = from u in ctx.Users
                         join Ex in ctx.Experiences
                         on u.UserID equals Ex.UserID
                         join skill in ctx.Skills
                             on Ex.SkillID equals skill.SkillID
                         where u.UserID == userlogged.UserID
                         select new ExViewModel()
                         {
                             IdEx = Ex.ExperienceID,
                             skill = skill.SkillName,
                             Des = Ex.Description,
                         };
            ViewBag.Exp = lstExp.ToList();
            return View();
        }


        [HttpPost]
        public ActionResult SaveExperience(string Des, int ExId)
        {
            var user = (UserSession)SessionHelper.GetSession();
            Experience newEx = new Experience();
            newEx.UserID = user.UserID;
            newEx.StartDate = DateTime.Today;
            newEx.SkillID = ExId;
            newEx.Description = Des;
            ctx.Experiences.Add(newEx);
            ctx.SaveChanges();
            return RedirectToAction("MyProfile");
        }

        [HttpPost]
        public ActionResult DelExperience(int ExId)
        {
            Experience newEx = ctx.Experiences.Where(x => x.ExperienceID == ExId).FirstOrDefault();
            ctx.Experiences.Remove(newEx);
            ctx.SaveChanges();
            return RedirectToAction("MyProfile");
        }


        public ActionResult MyJob()
        {
            var userId = SessionHelper.GetSession().UserID;
            List<UserJob> lstJob = ctx.UserJobs.Where(x => x.UserID == userId).ToList();
            List<Aspiration> Asp = new List<Aspiration>();

            foreach (var item in lstJob)
            {
                //var aj = ctx.AspirationSkills.Where(j => j.SkillID == item.JobID).First();
                //if (aj !=null)
                //{

                //    int tmp = aj.AspirationID;
                var ab = ctx.Aspirations.Where(x => x.AspirationsID == item.JobID).FirstOrDefault();
                if (ab != null)
                {
                    Asp.Add(ab);

                }
                //}



            }

            //var result = (from j in Asp
            //              join a in ctx.AspirationSkills
            //                 on j.AspirationsID equals a.AspirationID
            //              join u in ctx.UserAspirations
            //                 on j.AspirationsID equals u.AspirationsID
            //              join user in ctx.Users
            //                 on u.UserID equals user.UserID
            //              join lc in ctx.Locations
            //                 on user.LocationID equals lc.LocationID
            //              join userjob in ctx.UserJobs
            //                  on a.SkillID equals userjob.JobID
            //              select new ViewJob
            //              {
            //                  JobID = j.AspirationsID,
            //                  JobName = j.AspirationsName,
            //                  Recruit = user.Name,
            //                  Location = lc.LocationDetail,
            //                  //Status = userjob.Status

            //              }).GroupBy(x => x.JobID).Select(grp => grp.First()).ToList();
            var result = (from j in Asp


                          join userjob in ctx.UserJobs
                              on j.AspirationsID equals userjob.JobID
                          join user in ctx.Users
                            on userjob.UserID equals user.UserID
                          join lc in ctx.Locations
                             on user.LocationID equals lc.LocationID
                          select new ViewJob
                          {
                              JobID = j.AspirationsID,
                              JobName = j.AspirationsName,
                              //Recruit = user.Name,
                              Location = lc.LocationDetail,
                              //Status = userjob.Status

                          }).GroupBy(x => x.JobID).Select(grp => grp.First()).ToList();

            foreach (var item in result)
            {
                var ab = ctx.UserJobs.Where(x => x.UserID == userId && x.JobID == item.JobID).FirstOrDefault();
                if (ab != null)
                {
                    item.Status = ab.Status;
                }
				var UsAp = ctx.UserAspirations.Where(x => x.AspirationsID == item.JobID).FirstOrDefault();
				var name = ctx.Users.Where(x => x.UserID == UsAp.UserID).FirstOrDefault().Name;
				item.Recruit = name;
            }
            ViewBag.Jobs = result.ToList();
            return View();
        }

        [HttpPost]
        public bool DelJob(int id)
        {
            var user = (UserSession)SessionHelper.GetSession();
            //var jobId = ctx.AspirationSkills.Where(x => x.AspirationID == id).FirstOrDefault();
            var obj = ctx.UserJobs.Where(x => x.UserID == user.UserID && x.JobID == id).FirstOrDefault();
            ctx.UserJobs.Remove(obj);
            ctx.SaveChanges();
            return true;
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


            //var UserAsp = new UserAspiration();
            //UserAsp.AspirationsID = Id;
            //UserAsp.UserID = SessionHelper.GetSession().UserID;
            //ctx.UserAspirations.Add(UserAsp);
            //ctx.SaveChanges();

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



        public ActionResult MyAspiration()
        {
            var userId = SessionHelper.GetSession().UserID;
            var lstUserAsp = ctx.UserAspirations.Where(x => x.UserID == userId).ToList();
            var lstAps = new List<Aspiration>();
            var listEx = new List<Exception>();
            foreach (var item in lstUserAsp)
            {
                var objEx = ctx.Aspirations.Where(x => x.AspirationsID == item.AspirationsID).FirstOrDefault();
                if (objEx != null)
                {
                    lstAps.Add(objEx);
                }


            }
            //foreach (var item in lstUserAsp)
            //{
            //    var obj = ctx.Aspirations.Where(x => x.AspirationsID == item.AspirationsID).FirstOrDefault();
            //    lstAps.Add(obj);
            //}

            foreach (var item in lstAps)
            {
                var nameskil = "";
                var skill = "";
                var lstAspskill = ctx.AspirationSkills.Where(x => x.AspirationID == item.AspirationsID).ToList();
                //var apsjoin = ctx.AspirationSkills.Where(x => x.AspirationID == item.AspirationsID).ToList();
                foreach (var itemjoin in lstAspskill)
                {
                    var ex = ctx.Experiences.Where(x => x.ExperienceID == itemjoin.SkillID).FirstOrDefault();
                    //var ex = ctx.Skills.Where(x => x.SkillID == itemjoin.SkillID).FirstOrDefault();

                    if (ex != null)
                    {
                        skill = ctx.Skills.Where(x => x.SkillID == ex.SkillID).FirstOrDefault().SkillName;
                        nameskil = nameskil + ",<span style='display: inline-block;margin: 3px 5px;border: 1px solid #ccc;padding: 3px 8px;font-size: 13px;letter-spacing: 1px;text-transform: uppercase;color: #777;'>" + skill + "</span>";
                    }
                }
                if (nameskil != "")
                {
                    item.Description = nameskil.Substring(1);
                }
                


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
                var ex = ctx.Experiences.Where(x => x.ExperienceID == itemjoin.SkillID).FirstOrDefault();
                if (ex != null)
                {
                    lstskill.Add(ex.ExperienceID);
                }
                //var skill = ctx.Skills.Where(x => x.SkillID == ex.SkillID).FirstOrDefault().SkillID;
            }

            var data = new { id = obj.AspirationsID, des = obj.Description, name = obj.AspirationsName, skill = lstskill };
            return Json(data, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Recommend()
        {
            var userId = SessionHelper.GetSession().UserID;
            var skill = (from skil in ctx.Skills
                         join exp in ctx.Experiences
                         on skil.SkillID equals exp.SkillID
                         where exp.UserID == userId
                         select skil).ToList();
            var ListAsp = new List<Aspiration>();
            foreach (var item in skill)
            {
                var objAsp = (from Asp in ctx.Aspirations
                              join AspSkill in ctx.AspirationSkills
                              on Asp.AspirationsID equals AspSkill.AspirationID
                              join Job in ctx.Jobs
                              on AspSkill.SkillID equals Job.JobID
                              join skilldetail in ctx.SkillDetails
                              on Job.JobID equals skilldetail.JobID
                              join skillb in ctx.Skills
                              on skilldetail.SkillID equals skillb.SkillID
                              where skilldetail.SkillID == item.SkillID && Asp.Status == "Approve"
                              select Asp).ToList();
                foreach (var item2 in objAsp)
                {
                    ListAsp.Add(item2);
                }
            }
            foreach (var item in ListAsp)
            {
                item.Description = ListSkill(item.AspirationsID);
                item.Status = GetRecruiter(item.AspirationsID);
                var userjob = ctx.UserJobs.Where(x => x.JobID == item.AspirationsID && x.UserID == userId).FirstOrDefault();
                if (userjob != null)
                {
                    item.JobID = 1;
                }

            }
            ViewBag.Recommend = ListAsp.Distinct();
            return View();
        }


        public string ListSkill(int AspId)
        {
            var listAspSkill = ctx.AspirationSkills.Where(x => x.AspirationID == AspId).ToList();
            var listskill = "";
            foreach (var item in listAspSkill)
            {
                var job = ctx.Jobs.Where(x => x.JobID == item.SkillID).FirstOrDefault().JobName;
                listskill = listskill + "<li>" + job + "</li>";
            }

            return listskill;
        }

        public string GetRecruiter(int AspId)
        {
            var listAspSkill = ctx.AspirationSkills.Where(x => x.AspirationID == AspId).FirstOrDefault();
            var job = ctx.Jobs.Where(x => x.JobID == listAspSkill.SkillID).FirstOrDefault();
            var user = ctx.Users.Where(x => x.UserID == job.RecruiterID).FirstOrDefault();

            return user.Name;
        }

        [HttpPost]
        public bool ApplyJob(int id)
        {
            var user = (UserSession)SessionHelper.GetSession();
            var obj = new UserJob();
            obj.UserID = user.UserID;
            obj.JobID = id;
            obj.Status = "Not Activated";
            ctx.UserJobs.Add(obj);
            ctx.SaveChanges();
            return true;
        }

        public bool SaveFeedback(int idstudent, string content)
        {
            var userId = SessionHelper.GetSession().UserID;
            var idrec = ctx.UserAspirations.Where(x => x.AspirationsID == idstudent).FirstOrDefault();
            var recruiter = ctx.Users.Where(x => x.UserID == idrec.UserID).FirstOrDefault();

            var obj = new Feedback();
            obj.Content = content;
            obj.StudentID = userId;
            obj.FeedbackTypeID = 2;
            obj.RecruiterID = recruiter.UserID;
            ctx.Feedbacks.Add(obj);
            ctx.SaveChanges();
            return true;
        }
    }

    public class ViewJob
    {
        public int JobID { get; set; }
        public string JobName { get; set; }
        public string ContentJob { get; set; }
        public int? AmountStudent { get; set; }
        public string Recruit { get; set; }
        public string Location { get; set; }

        public string Status { get; set; }
    }
}
