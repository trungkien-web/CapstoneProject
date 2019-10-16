using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Common
{
	public static class CommonUser
	{
		static FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		public static User GET_USER_BY_ID(int id)
		{
			var user = ctx.Users.Where(u => u.UserID == id).FirstOrDefault();
			return user;
		}

		public static List<User> GET_ALL_USER()
		{
			var user = ctx.Users.ToList();
			return user;
		}

		public static string GET_ROLE(User user)
		{
			var userRole = ctx.UserRoles.Where(x => x.UserID == user.UserID).FirstOrDefault();
			var role = ctx.Roles.Where(x => x.RoleID == userRole.RoleID).FirstOrDefault();
			return role.RoleName;
		}
	}
}
