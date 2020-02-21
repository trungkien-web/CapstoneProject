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
using System.IO;

namespace FPTInternshipManagement.Controllers.Recruiter
{
	[Authorize(Roles = "Recruiter")]
   
    public class RecruiterController : Controller
    {
        ISkillService skillService = new SkillService();
        IUserService useService = new UserService();
        IImageService imgService = new ImageService();
        ILocationService locationService = new LocationService();
        IDepartmentService departmentService = new DepartmentService();
        IStudentAspirationService studentAspirationService = new StudentAspirationService();
        FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
        // GET: Recruiter
        public ActionResult Index()
        {
            var userId = SessionHelper.GetSession().UserID;//UserID
            var Infor = useService.GetUserById(userId);
            var img = "~/Assets/imagés/no-img.png";
            if (!string.IsNullOrEmpty(Infor.ImageID.ToString()))
            {
                img = imgService.GetImageById(Infor.ImageID.GetValueOrDefault()).Path;
                img = img.Substring(1);

            }
            ViewBag.Image = img;
            ViewBag.Mail = Infor.Email;
            ViewBag.userID = userId;
            ViewBag.Name = Infor.Name;
            ViewBag.Address2 = Infor.LocationID.GetValueOrDefault();
            ViewBag.Location = locationService.GetAllLocation();
            ViewBag.Skills = skillService.GetAllSkills();


            var userlogged = (UserSession)SessionHelper.GetSession();
            var lstBaiDang = from u in ctx.Users
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

            ViewBag.lstBaiDang = lstBaiDang.ToList();
            return View(Infor);
		}
		public ActionResult PublishedRecruitment()
		{
			return View();
		}

        public ActionResult Job()
        {
            var userId = SessionHelper.GetSession().UserID;//UserID
            List<Job> lstJob = ctx.Jobs.Where(x=>x.RecruiterID == userId).ToList();
            ViewBag.Jobs = lstJob;

            var userlogged = (UserSession)SessionHelper.GetSession();
            var lstExp = from u in ctx.Jobs
                         where u.RecruiterID == userlogged.UserID
                         select new ExViewModel()
                         {
                             IdEx = u.JobID,
                             skill = u.JobName,
                             Des = "",
                         };

            ViewBag.Exp = lstExp.ToList();
            return View();
        }

        [HttpPost]
        public bool AddJob(string jobname, string contentjob,int amountstudent)
        {
            var result = false;
            try
            {
                var userId = SessionHelper.GetSession().UserID;//UserID
                var lstJob = new Job();
                lstJob.RecruiterID = userId;
                lstJob.JobName = jobname;
                lstJob.ContentJob = contentjob;
                lstJob.AmountStudent = amountstudent;
                lstJob.Status = "Available";
                lstJob.LocationID = 1;
                ctx.Jobs.Add(lstJob);
                ctx.SaveChanges();
                result = true;
            }
            catch (Exception ex)
            {

                throw;
            }
            return result;
           
        }

        [HttpPost]
        public bool DelJob(int id)
        {
            var result = false;
            try
            {

                var usejob = ctx.UserJobs.Where(x => x.JobID == id).ToList();
                foreach (var item in usejob)
                {
                    ctx.UserJobs.Remove(item);
                }
                ctx.SaveChanges();

                var Job = ctx.Jobs.Where(x=>x.JobID == id).FirstOrDefault();
                ctx.Jobs.Remove(Job);
                ctx.SaveChanges();
                result = true;
            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }

        [HttpPost]
        public ActionResult MyProfile(FormCollection fc, HttpPostedFileBase fileimage)
        {

            var user = (UserSession)SessionHelper.GetSession();
            var obj = ctx.Users.Where(x => x.UserID == user.UserID).FirstOrDefault();
            obj.Name = fc["Name"].ToString();
            obj.Email = fc["Mail"].ToString();
            obj.Address = fc["Address"].ToString();
            obj.Code = fc["Code"].ToString();
            obj.Nameoflegalrepresentative = fc["Nameoflegalrepresentative"].ToString();
            obj.LocationID = int.Parse(fc["location"]);

           

			if (fileimage != null)
			{
				var fileName = Path.GetFileName(fileimage.FileName); //getting only file name(ex-ganesh.jpg)  
				var ext = Path.GetExtension(fileimage.FileName); //getting the extension(ex-.jpg)  
				string name = Path.GetFileNameWithoutExtension(fileName);
				var path = Path.Combine(Server.MapPath("~/Assets/images/"), fileName);

				var img = ctx.Images.Where(x => x.ImageID == obj.ImageID).FirstOrDefault();
				if (img != null)
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
					obj.ImageID = idimg;
				}

				fileimage.SaveAs(path);
			}
			ctx.SaveChanges();
			return RedirectToAction("Index");

        }


        public ActionResult SearchStudent()
		{
           
            var listStudent = (from u in ctx.Users
                               join role in ctx.UserRoles
                                    on u.UserID equals role.UserID
                               where
                                    role.RoleID == 2
                                    && u.Status.Equals("Activated")
                               select new StudentModel()
                               {
                                   name = u.Name,
                                   code = u.Code.ToString(),
                                   email = u.Email,
                                   phoneNumb = u.Phone.ToString(),
                                   specialized = u.Specialized,
                                   course = u.GPA,
                                   cv = u.CV,
                                   status = u.Status,
                                   semester = u.Semester,
                                   image = u.ImageID.ToString()
                                   
                               }).ToList();
            var img = "~/Assets/images/no-img.png";
            foreach (var item in listStudent)
            {
                if (item.image == "" || item.image == null)
                {
                    item.image = img;
                }
                else
                {
                    var idimg = int.Parse(item.image);
                    var imgnew = ctx.Images.Where(x => x.ImageID == idimg).FirstOrDefault();
                    item.image = imgnew.Path;
                }

            }
            return View(listStudent);
		}

        [HttpPost]
        public ActionResult SearchAction(string StudentName,string location)
        {

            var listStudent =(from u in ctx.Users
                              join role in ctx.UserRoles
                                   on u.UserID equals role.UserID
                              where
                                   role.RoleID == 2
                                   && u.Status.Equals("Activated")
                              select new StudentModel()
                         {
                             name = u.Name,
                            code = u.Code.ToString(),
                            email = u.Email,
                            phoneNumb = u.Phone.ToString(),
                            specialized = u.Specialized,
                            course = u.GPA,
                            cv = u.CV,
                           status = u.Status,
                           semester = u.Semester,
                                  image = u.ImageID.ToString()
                              }).ToList();

            if(!string.IsNullOrEmpty(StudentName))
            {
                listStudent = listStudent.Where(x => x.name.Contains(StudentName)).ToList();
            }

            var img = "~/Assets/images/no-img.png";
            foreach (var item in listStudent)
            {
                if (item.image == "" || item.image == null)
                {
                    item.image = img;
                }
                else
                {
                    var idimg = int.Parse(item.image);
                    var imgnew = ctx.Images.Where(x => x.ImageID == idimg).FirstOrDefault();
                    item.image = imgnew.Path;
                }

            }
            return View(listStudent);
        }

        public ActionResult MyAspiration()
        {
            var userId = SessionHelper.GetSession().UserID;
            var lstUserAsp = ctx.UserAspirations.Where(x => x.UserID == userId).ToList();
            var lstAps = new List<Aspiration>();
            foreach (var item in lstUserAsp)
            {
                var obj = ctx.Aspirations.Where(x => x.AspirationsID == item.AspirationsID).FirstOrDefault();
                if(obj !=null)
                {
                    lstAps.Add(obj);
                }
            }

            foreach (var item in lstAps)
            {
                var nameskil = "";
                var apsjoin = ctx.AspirationSkills.Where(x => x.AspirationID == item.AspirationsID).ToList();
                foreach (var itemjoin in apsjoin)
                {
                    var job = ctx.Jobs.Where(x => x.JobID == itemjoin.SkillID).FirstOrDefault();
                    if (job != null)
                    {
                        nameskil = nameskil + "<li style='width: 100%;margin: 3px 5px;border: 1px solid #ccc;padding: 3px 8px;font-size: 13px;letter-spacing: 1px;text-transform: uppercase;color: #777;'>" + job.JobName + "</li>";
                    }

                   
                }

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
                var skill = ctx.Jobs.Where(x => x.JobID == itemjoin.SkillID).FirstOrDefault();
                if (skill != null)
                {
                    lstskill.Add(skill.JobID);
                }

                
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
        public bool SaveAspiration(string Des, string Skill, string Name)
        {
            var newobj = new Aspiration(); // add vao table Asp
            newobj.Description = Des;
            newobj.AspirationsName = Name;
            newobj.Status = "Approve";
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


        public ActionResult ViewApply(int id)
        {
            var UserJob = ctx.UserJobs.Where(x => x.JobID == id).ToList();
            var listStudent = new List<User>();
            foreach (var item in UserJob)
            {
                var obj = ctx.Users.Where(x => x.UserID == item.UserID).FirstOrDefault();
                obj.Status = item.Status;
                listStudent.Add(obj);
            }
            var img = "~/Assets/images/no-img.png";
            foreach (var item in listStudent)
            {
                if (item.ImageID == null)
                {
                    item.Password = img;
                }
                else
                {
                    var imgnew = ctx.Images.Where(x => x.ImageID == item.ImageID).FirstOrDefault();
                    item.Password = imgnew.Path;
                }

            }
            ViewBag.ViewId = id;
            ViewBag.listStudent = listStudent;
            return View();
        }


        [HttpPost]
        public bool Accept(int ViewId, int UserId)
        {
            
            var UserJob = ctx.UserJobs.Where(x => x.UserID == UserId && x.JobID == ViewId).FirstOrDefault();
            
            if (UserJob.Status != "Activated")
            {
                UserJob.Status = "Activated";
                ctx.SaveChanges();
            }
            else
            {
                ViewBag.StudentIsActived = "Students have been recruited";
            }
                

            return true;
        }

        [HttpPost]
        public bool Reject(int ViewId, int UserId)
        {
            var UserJob = ctx.UserJobs.Where(x => x.UserID == UserId && x.JobID == ViewId).FirstOrDefault();
            UserJob.Status = "Reject";
            ctx.SaveChanges();

            return true;
        }



        public ActionResult JobSub()
        {
            var userId = SessionHelper.GetSession().UserID;//UserID
            List<Job> lstJob = ctx.Jobs.Where(x => x.RecruiterID == userId).ToList();
            ViewBag.Jobs = lstJob;

            foreach (var item in lstJob)
            {
                var nameskil = "";
                var apsjoin = ctx.SkillDetails.Where(x => x.JobID == item.JobID).ToList();
                foreach (var itemjoin in apsjoin)
                {
                    var skill = ctx.Skills.Where(x => x.SkillID == itemjoin.SkillID).FirstOrDefault().SkillName;

                    nameskil = nameskil + ",<span style='display: inline-block;margin: 3px 5px;border: 1px solid #ccc;padding: 3px 8px;font-size: 13px;letter-spacing: 1px;text-transform: uppercase;color: #777;'>" + skill + "</span>";
                }
                if (!string.IsNullOrEmpty(nameskil))
                {
                    item.SkillGen = nameskil.Substring(1);
                }
                

            }

            var lstExp = from u in ctx.Skills
                         select new ExViewModel()
                         {
                             IdEx = u.SkillID,
                             skill = u.SkillName,
                             Des = "",
                         };

            ViewBag.Exp = lstExp.ToList();
            return View();
        }

        [HttpPost]
        public bool AddJobSub(string jobname, string contentjob, int amountstudent, string skill)
        {
            var result = false;
            try
            {
                var userId = SessionHelper.GetSession().UserID;//UserID

               

                var lstJob = new Job();
                lstJob.RecruiterID = userId;
                lstJob.JobName = jobname;
                lstJob.ContentJob = contentjob;
                lstJob.AmountStudent = amountstudent;
                lstJob.Status = "Available";
                lstJob.LocationID = 1;
                ctx.Jobs.Add(lstJob);
                ctx.SaveChanges();

                var id = lstJob.JobID;


                var lstskill = skill.Split(',');
                foreach (var item in lstskill) // add vao tale AspSkill
                {
                    var SD = new SkillDetail();
                    SD.JobID = id;
                    SD.SkillID = int.Parse(item);
                    ctx.SkillDetails.Add(SD);
                    ctx.SaveChanges();
                }
                result = true;


            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }

        [HttpPost]
        public bool DelJobSub(int id)
        {
            var result = false;
            try
            {
				var lstskilldetail = ctx.SkillDetails.Where(x => x.JobID == id).ToList();
				foreach (var item in lstskilldetail)
				{
					ctx.SkillDetails.Remove(item);
				}
				ctx.SaveChanges();

				var Job = ctx.Jobs.Where(x => x.JobID == id).FirstOrDefault();
                ctx.Jobs.Remove(Job);
                ctx.SaveChanges();
                result = true;
            }
            catch (Exception ex)
            {

                throw;
            }
            return result;

        }

        public ActionResult Recommend()
        {
            var userId = SessionHelper.GetSession().UserID;
            var skill = (from skil in ctx.Skills
                         join skildetail in ctx.SkillDetails
                        on skil.SkillID equals skildetail.SkillID
                         join job in ctx.Jobs
                         on skildetail.JobID equals job.JobID
                         where job.RecruiterID == userId
                         select skil).ToList();
            var ListUser = new List<User>();
            foreach (var item in skill)
            {
                var objAsp = ( from u in ctx.Users
                               join ex in ctx.Experiences
                               on u.UserID equals ex.UserID
                               where ex.SkillID == item.SkillID
                              select u).ToList();
                foreach (var item2 in objAsp)
                {
                    item2.Description = ListSkill(item2.UserID);
                    ListUser.Add(item2);
                }
            }

            var img = "~/Assets/images/no-img.png";
            foreach (var item in ListUser)
            {
                if (item.ImageID == null)
                {
                    item.Status = img;
                }
                else
                {
                    var imgnew = ctx.Images.Where(x => x.ImageID == item.ImageID).FirstOrDefault();
                    item.Status = imgnew.Path;
                }

            }
            ViewBag.Recommend = ListUser.Distinct();
            ViewBag.lstNot = ctx.Notifications.Take(8).ToList();
            return View();
        }


        public string ListSkill(int studentId)
        {
            var exp = ctx.Experiences.Where(x => x.UserID == studentId).ToList();
            var listskill = "";
            foreach (var item in exp)
            {
                var job = ctx.Skills.Where(x => x.SkillID == item.SkillID).FirstOrDefault().SkillName;
                listskill = listskill + "<li style='float:left;border:1px solid #13ad6d;padding: 0px 10px;'>" + job + "</li>";
            }
            return listskill;
        }

        public bool SaveFeedback(int idstudent, string content)
        {
            var userId = SessionHelper.GetSession().UserID;
            var obj = new Feedback();
            obj.Content = content;
            obj.StudentID = idstudent;
            obj.FeedbackTypeID = 1;
            obj.RecruiterID = userId;
            ctx.Feedbacks.Add(obj);
            ctx.SaveChanges();
            return true;
        }


        public bool SaveReport(int idstudent, string content,string course,string grade)
        {
            var userId = SessionHelper.GetSession().UserID;
            var obj = new Report();
            obj.Comment = content;
            obj.Course = course;
            obj.CreatedDate = DateTime.Now;
            obj.Grade = Convert.ToDouble( grade);
            obj.StudentID = idstudent;
            obj.RecruiterID = userId;
            ctx.Reports.Add(obj);
            ctx.SaveChanges();
            return true;
        }
    }
}