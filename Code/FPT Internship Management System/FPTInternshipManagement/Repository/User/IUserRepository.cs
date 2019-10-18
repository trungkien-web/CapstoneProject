using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	interface IUserRepository
	{
		User GetUserById(int id);
		List<User> GetAllUser();
		string GetRole(User user);
	}
}
