using FPTInternshipManagement.Common;
using Helper;
using Model;
using Repository.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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
			var passm5 = MD5Gende(password);

		var user = ctx.Users.SingleOrDefault(x => x.Username == username && x.Password == passm5);
			if (user != null && user.Status == CommonConstants.ACCOUNT_ACTIVATED)
			{
				return true;
			} else if(user != null && user.Status == CommonConstants.ACCOUNT_NOT_ACTIVATED)
			{
				errorMessage = CommonConstants.MESSAGE_ACCOUNT_NOT_ACTIVATED;
				return false;
			}
			else if (user != null && user.Status == CommonConstants.ACCOUNT_REJECT)
			{
				errorMessage = CommonConstants.MESSAGE_ACCOUNT_REJECT;
				return false;
			}
			else if(user == null)
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
			var userDetails = ctx.Users.Where(x => x.Username == user.Username ).FirstOrDefault();
			return userRepository.GetRole(userDetails);
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
	}
}
