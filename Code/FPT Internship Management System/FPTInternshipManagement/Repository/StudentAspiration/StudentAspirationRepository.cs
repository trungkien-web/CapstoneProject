using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Repository
{
	public class StudentAspirationRepository : IStudentAspirationRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();

		public bool CheckAspiration(int userId)
		{
			//var user = ctx.Users.Where(u => u.UserID == userId).FirstOrDefault();
			//return user.AspirationsID != null;
			return false;
		}

		public Aspiration GetAspirationById(int id)
		{
			return ctx.Aspirations.Where(a => a.AspirationsID == id).FirstOrDefault();
		}

		public void InsertListSkillsAspiration(List<string> listId, int aspirationId)
		{
			SkillDetail skillList;
			foreach (var id in listId)
			{
				skillList = new SkillDetail();
				skillList.SkillID = Int32.Parse(id);
				skillList.AspirationsID = aspirationId;
				ctx.SkillDetails.Add(skillList);
				ctx.SaveChanges();
			}
		}

		public void InsertStudentAspiration(Aspiration aspiration, int userId, List<string> listId)
		{
			try
			{
				aspiration.Status = "Available";
				ctx.Aspirations.Add(aspiration);
				ctx.SaveChanges();
				InsertUserAspiration(aspiration, userId);
				InsertListSkillsAspiration(listId, aspiration.AspirationsID);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public void InsertUserAspiration(Aspiration aspiration, int userId)
		{
			UserAspiration userAspiration = new UserAspiration();
			userAspiration.AspirationsID = aspiration.AspirationsID;
			userAspiration.UserID = userId;
			ctx.UserAspirations.Add(userAspiration);
			ctx.SaveChanges();
			//var user = ctx.Users.Where(u => u.UserID == userId).FirstOrDefault();
			//user.AspirationsID = id;
			//ctx.SaveChanges();
		}

	}
}
