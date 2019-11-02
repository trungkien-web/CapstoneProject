using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public interface IUserRepository
	{
		User GetUserById(int id);
		List<User> GetAllUser();
		string GetRole(User user);

		User GetUserByName(string username);

		// Get all student is active
		List<User> GetAllStudents();

		// Get all student is active with name
		List<User> SearchStudentsNameOnly(string studentName);

		// Get all student is active with userid, name, location
		List<User> SearchStudents(string location, int userID, string userName);

		List<User> SearchStudentsWithId(int userID);

		void InsertStudent(User newStudent);

		void UpdateStudent(User newStudent);

		List<User> SearchStudentsInTime(DateTime startDate, DateTime endDate);

		List<User> SearchStudentsDetail(DateTime startDate, DateTime endDate, string location, int userID, string userName);
	}
}
