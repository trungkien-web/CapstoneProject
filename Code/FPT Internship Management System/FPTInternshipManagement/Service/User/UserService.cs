using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
	public class UserService : IUserService
	{
		IUserRepository repository = new UserRepository();
		public string GetRole(User user)
		{
			return repository.GetRole(user);
		}

		public User GetUserByName(string username)
		{
			return repository.GetUserByName(username);
		}
	}
}
