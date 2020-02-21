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

		public User GetUserById(int id)
		{
			return repository.GetUserById(id);
		}

        //TUNGBC update student by user
		public void UpdateStudent(User newStudent)
		{
			 repository.UpdateStudent(newStudent);
		}
	}
}
