using FPTInternshipManagement.Common;
using Model;
using Repository.Common;
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
				}
				else if (userDetails.Status != CommonConstants.ACCOUNT_ACTIVATED)
				{
					user.LoginErrorMessage = "Tài khoản chưa được kích hoạt.";
					return null;
				}
			return CommonUser.GET_ROLE(userDetails);
		}
	}
}
