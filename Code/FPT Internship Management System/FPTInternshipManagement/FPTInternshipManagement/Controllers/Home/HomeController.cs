using Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FPTInternshipManagement.Models;
using Helper;
using Model;
using System.Security.Cryptography;
using System.Text;
using PagedList;
namespace FPTInternshipManagement.Controllers
{
	public class HomeController : Controller
	{
		ILocationService locationService = new LocationService();
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		public ActionResult Index()
		{
			IDepartmentService departmentService = new DepartmentService();
			IRateService rateService = new RateService();
			Dictionary<string, string> keyValues= departmentService.GetToDictionaryHome();
			ViewBag.KeyValues = keyValues;
			ViewBag.TopRecruiter = rateService.GetTotalJobByRecruiter();
			ViewBag.TopLocation = rateService.GetLocaltionByRecruiter();
			ViewBag.TopImage = rateService.GetImageByRecruiter();
            //ViewBag.StartUL = "<ul class=\"list-unstyled py-md-5 py-3 partners-icon text- center\" style=\"width: max-content;\">";
            ViewBag.StartUL = "<tr>";
            ViewBag.EndUL = "</tr>";
            //ViewBag.EndUL = "</ul>";
            return View();
		}

		public PartialViewResult Header()
		{
			ViewBag.Location = locationService.GetAllLocation();
			return PartialView();
		}

		public ActionResult Contact()
		{
			ViewBag.Location = locationService.GetAllLocation();
			return View();
		}

		public ActionResult LoginPage()
		{
			return View();
		}

		public ActionResult ChangePasswordPage()
		{
			return View();
		}
		public ActionResult About()
        {
            return View();
        }

        public ActionResult JobList()
		{
            IJobListService jobService = new JobListService();
            ILocationService location = new LocationService();
            List<JobListModel> jobListModel = new List<JobListModel>();
            ViewBag.Location = ctx.Locations.ToList();

            ctx.Configuration.ProxyCreationEnabled = false;
            List<int> lstskill = new List<int>();

            var lstExp = new List<JobListModel>();

            lstExp = (from Asp in ctx.Aspirations
                      join UserAsp in ctx.UserAspirations
                         on Asp.AspirationsID equals UserAsp.AspirationsID
                      join User in ctx.Users
                          on UserAsp.UserID equals User.UserID
                      join Local in ctx.Locations
                           on User.LocationID equals Local.LocationID
                      join aspskill in ctx.AspirationSkills
                       on Asp.AspirationsID equals aspskill.AspirationID
                      join job in ctx.Jobs
                      on aspskill.SkillID equals job.JobID
                      join role in ctx.UserRoles
                     on User.UserID equals role.UserID
                      join skildetai in ctx.SkillDetails
                      on job.JobID equals skildetai.JobID
                      join skill in ctx.Skills
                      on skildetai.SkillID equals skill.SkillID
                      where (role.RoleID == 3 && Asp.Status == "Approve")


                      select new JobListModel()
                      {
                          JobID = Asp.AspirationsID,
                          JobName = Asp.AspirationsName,
                          Recruiter = User.Name,
                          LocationName = Local.LocationDetail

                      }).Distinct().ToList();
            var userid = (UserSession)SessionHelper.GetSession();

            foreach (var item in lstExp)
            {
                item.ListSkill = ListSkill(item.JobID);
                if ((UserSession)SessionHelper.GetSession() != null)
                {
                    //var aj = ctx.AspirationSkills.Where(x => x.AspirationID == item.JobID).FirstOrDefault();
                    var obj = ctx.UserJobs.Where(x => x.UserID == userid.UserID && x.JobID == item.JobID).FirstOrDefault();
                    if (obj != null)
                    {
                        item.Status = "Applyed";
                    }
                }
            }


            ViewData["JobList"] = lstExp.ToList();
            return View(lstExp.ToList());

        }



        [HttpPost]
		public ActionResult SearchJob(string keyword, string select)
		{

			IJobListService jobService = new JobListService();
			ILocationService location = new LocationService();
			List<JobListModel> jobListModel = new List<JobListModel>();
			
			var lstExp = new List<JobListModel>() ;
			if(!string.IsNullOrEmpty(keyword))
			{
				lstExp = (from Asp in ctx.Aspirations
						  join UserAsp in ctx.UserAspirations
							 on Asp.AspirationsID equals UserAsp.AspirationsID
						  join User in ctx.Users
							  on UserAsp.UserID equals User.UserID
						  join Local in ctx.Locations
							   on User.LocationID equals Local.LocationID
						  join aspskill in ctx.AspirationSkills
						   on Asp.AspirationsID equals aspskill.AspirationID
						  join job in ctx.Jobs
						  on aspskill.SkillID equals job.JobID
						  join role in ctx.UserRoles
						 on User.UserID equals role.UserID
						  join skildetai in ctx.SkillDetails
						  on job.JobID equals skildetai.JobID
						  join skill in ctx.Skills
						  on skildetai.SkillID equals skill.SkillID
						  where (role.RoleID == 3 && Asp.Status == "Approve")
						  && (skill.SkillName.Contains(keyword))

						  select new JobListModel()
						  {
							  JobID = Asp.AspirationsID,
							  JobName = Asp.AspirationsName,
							  Recruiter = User.Name,
							  LocationName = Local.LocationDetail

						  }).Distinct().ToList();

			}
			else

			{
				lstExp = (from Asp in ctx.Aspirations
						  join UserAsp in ctx.UserAspirations
							 on Asp.AspirationsID equals UserAsp.AspirationsID
						  join User in ctx.Users
							  on UserAsp.UserID equals User.UserID
						  join Local in ctx.Locations
							   on User.LocationID equals Local.LocationID
						  join aspskill in ctx.AspirationSkills
						   on Asp.AspirationsID equals aspskill.AspirationID
						  join job in ctx.Jobs
						  on aspskill.SkillID equals job.JobID
						  join role in ctx.UserRoles
						 on User.UserID equals role.UserID
						  join skildetai in ctx.SkillDetails
						  on job.JobID equals skildetai.JobID
						  join skill in ctx.Skills
						  on skildetai.SkillID equals skill.SkillID
						  where (role.RoleID == 3 && Asp.Status == "Approve")
						  select new JobListModel()
						  {
							  JobID = Asp.AspirationsID,
							  JobName = Asp.AspirationsName,
							  Recruiter = User.Name,
							  LocationName = Local.LocationDetail,
							  LocationID = Local.LocationID

						  }).Distinct().ToList();
			}

			

			if (select !="" && select != null)
			{
				var selected = select.Split(',');
				var listselect = new List<int>();
				foreach (var item in selected)
				{
					listselect.Add(int.Parse(item));
				}	
				lstExp = lstExp.Where(x => listselect.Contains(x.LocationID)).ToList();

			}


			foreach (var item in lstExp)
			{
				item.ListSkill = ListSkill(item.JobID);
			}

			return PartialView(lstExp);
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

		[HttpPost]
		public bool ApplyJob(int id)
		{
            var user = (UserSession)SessionHelper.GetSession();
            var obj = new UserJob();
            obj.UserID = user.UserID;
            var job = ctx.AspirationSkills.Where(x => x.AspirationID == id).FirstOrDefault();
            //obj.JobID = job.SkillID;
            obj.JobID = id;
            obj.Status = "Not Activated";
            ctx.UserJobs.Add(obj);
            ctx.SaveChanges();
            return true;
        }


		public ActionResult JobDetail(int id)
		{

			var Asp = ctx.Aspirations.Where(x => x.AspirationsID == id).FirstOrDefault();
			var Aspskill = ctx.AspirationSkills.Where(x => x.AspirationID == Asp.AspirationsID).ToList();
			var lstJob = new List<Job>();
			foreach (var item in Aspskill)
			{
				var job = ctx.Jobs.Where(x => x.JobID == item.SkillID).FirstOrDefault();
				job.SkillGen = ListSkillInJob(job.JobID);
				lstJob.Add(job);
				
			}

			ViewBag.AspName = Asp.AspirationsName;
			ViewBag.AspDes = Asp.Description;
			ViewBag.job = lstJob;
			return View();
		}

		public string ListSkillInJob(int jobid)
		{
			var job = ctx.SkillDetails.Where(x => x.JobID == jobid).ToList();
			var listskill = "";
			foreach (var item in job)
			{
				var sk = ctx.Skills.Where(x => x.SkillID == item.SkillID).FirstOrDefault().SkillName;
				listskill = listskill + "<li>" + sk + "</li>";
			}

			return listskill;
		}


	


		[HttpPost]
		public bool Registry(string name, string username, string email, int location, string password)
		{
			var obj = new User();
			obj.Name = name;
			obj.Username = username;
			obj.Password = MD5Gende(password);
			obj.LocationID = location;
			obj.Email = email;
			obj.Status = "Not Activated";
			ctx.Users.Add(obj);
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

		



		[HttpPost]
		public JsonResult ContactPost(string name, int mobile, string email, string message, int location,string nameof ,string code,string address)
		{
			var usercheck = ctx.Users.Where(x => x.Username == name).FirstOrDefault();
			if (usercheck != null)
			{
				return Json(new { Data = "Account already exists in the system", Status = "Fail" });
			}
			else
			{
				var emailcheck = ctx.Users.Where(x => x.Email == email).FirstOrDefault();
				if (emailcheck !=null)
				{
					return Json(new { Data = "Email already exists in the system", Status="Fail" });
				}
				else
				{
					

					var user = new User();
					user.Name = name;
					user.Phone = mobile;
					user.Code = code;
					user.Nameoflegalrepresentative = nameof;
					user.Email = email;
					user.LocationID = location;
					user.Address = address;
					user.Username = email;
					user.Status = "Not Activated";
					user.Password = MD5Gende(name+"@123");
					ctx.Users.Add(user);
					ctx.SaveChanges();

					var id = user.UserID;
					var userrole = new UserRole();
					userrole.UserID = id;
					userrole.RoleID = 3;
					ctx.UserRoles.Add(userrole);
					ctx.SaveChanges();

					return Json(new { Data = "Information has been recorded! Pending review status", Status = "True" });
				}

			}

			
		}


		public static List<Notification> lstNotify = new List<Notification>()
		{

		};

		public ActionResult NotifyAll()
		{
			lstNotify = ctx.Notifications.ToList();
			return View();
		}

		public PartialViewResult GetpaingNotify(int? page)
		{
			int pageSize = 8;
			int pageNumber = (page ?? 1);
			return PartialView("GetpaingNotify", lstNotify.ToPagedList(pageNumber, pageSize));
		}

		public ActionResult NotifyDetail(int id)
		{
			var obj = ctx.Notifications.Where(x => x.NotificationID == id).FirstOrDefault();
			return View(obj);
		}

		[HttpPost]
		public JsonResult ChangePassword(string username, string oldpassword, string newpassword)
		{
			var objpass = MD5Gende(oldpassword);
			var user = ctx.Users.Where(x => x.Username == username && x.Password == objpass).FirstOrDefault();
			if (user != null)
			{
				user.Password = MD5Gende(newpassword);
				ctx.SaveChanges();
				return Json(new { Data = "Change Success", Status = "True" });
			}
			else
			{
				return Json(new { Data = "Account not exists", Status = "Fail" });
			}

			
		}
	}
}