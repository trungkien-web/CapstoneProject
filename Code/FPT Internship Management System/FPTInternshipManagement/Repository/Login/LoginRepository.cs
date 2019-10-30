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
		UserRepository userRepository = new UserRepository();
		string errorMessage = null;

		public bool CheckLogin(string username, string password)
		{
			var user = ctx.Users.SingleOrDefault(x => x.Username == username && x.Password == password);
			if (user != null && user.Status == CommonConstants.ACCOUNT_ACTIVATED)
			{
				return true;
			} else if(user != null && user.Status == CommonConstants.ACCOUNT_NOT_ACTIVATED)
			{
				errorMessage = CommonConstants.MESSAGE_ACCOUNT_NOT_ACTIVATED;
				return false;
			} else if(user == null)
			{
				errorMessage = CommonConstants.MESSAGE_WRONG_LOGIN;
				return false;
			}
			return false;
		}

		public string GetErrorMessage()
		{
			return errorMessage;
		}

		public string GetRole(User user)
		{
			var userDetails = ctx.Users.Where(x => x.Username == user.Username && x.Password == user.Password).FirstOrDefault();
			return userRepository.GetRole(userDetails);
		}
	}
}
