using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	class UserRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		public User GetUserById(int id)
		{
			var user = ctx.Users.Where(u => u.UserID == id).FirstOrDefault();
			return user;
		}

		public List<User> GetAllUser()
		{
			var user = ctx.Users.ToList();
			return user;
		}

		public string GetRole(User user)
		{
			var userRole = ctx.UserRoles.Where(x => x.UserID == user.UserID).FirstOrDefault();
			var role = ctx.Roles.Where(x => x.RoleID == userRole.RoleID).FirstOrDefault();
			return role.RoleName;
		}
	}
}
