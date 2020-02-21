using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
	public interface IUserService
	{
		string GetRole(User user);
		User GetUserByName(string username);

		void UpdateStudent(User newStudent);
		User GetUserById(int id);
	}
}
