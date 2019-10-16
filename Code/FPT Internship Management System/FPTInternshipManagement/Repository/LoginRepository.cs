using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public class LoginRepository : ILoginRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();

		public string GetRole(User user)
		{
			var userDetails = ctx.Users.Where(x => x.Username == user.Username && x.Password == user.Password).FirstOrDefault();
			if (userDetails == null)
			{
				user.LoginErrorMessage = "Sai tên đăng nhập hoặc mật khẩu.";
				return null;
			} else if(userDetails.Status != "Activated")
			{
				user.LoginErrorMessage = "Tài khoản chưa được kích hoạt.";
				return null;
			}
			var userRole = ctx.UserRoles.Where(x => x.UserID == userDetails.UserID).FirstOrDefault();
			var role = ctx.Roles.Where(x => x.RoleID == userRole.RoleID).FirstOrDefault();

			return role.RoleName;
		}
	}
}
