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
        
        // Get all student is active
        List<User> GetAllStudents();

        // Get all student is active with name
        List<User> SearchStudentsNameOnly(string studentName);

        // Get all student is active with userid, name, location
        List<User> SearchStudentsWithLocaTion(string location, int userID, string userName);

        List<User> SearchStudentsWithId(int userID);
    }
}
