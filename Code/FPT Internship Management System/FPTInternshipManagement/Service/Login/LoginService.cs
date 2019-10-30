using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
	public class LoginService : ILoginService
	{
		ILoginRepository repository = new LoginRepository();

		public bool CheckLogin(string username, string password)
		{
			return repository.CheckLogin(username, password);
		}

		public string GetErrorMessage()
		{
			return repository.GetErrorMessage();
		}

		public string GetRole(User user)
		{
			return repository.GetRole(user);
		}
	}
}
