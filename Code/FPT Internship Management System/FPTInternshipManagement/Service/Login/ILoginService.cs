using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
	public interface ILoginService
	{
		string GetErrorMessage();
		Boolean CheckLogin(string username, string password);
		string GetRole(User user);
	}
}
