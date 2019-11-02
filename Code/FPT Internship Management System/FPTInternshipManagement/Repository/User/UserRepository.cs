using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public class UserRepository : IUserRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		public User GetUserById(int id)
		{
			var user = ctx.Users.Where(u => u.UserID == id).FirstOrDefault();
			return user;
		}

		public List<User> GetAllUser()
		{
			var user = ctx.Users.ToList();
			return user;
		}

		public string GetRole(User user)
		{
			var userRole = ctx.UserRoles.Where(x => x.UserID == user.UserID).FirstOrDefault();
			var role = ctx.Roles.Where(x => x.RoleID == userRole.RoleID).FirstOrDefault();
			return role.RoleName;
		}

        // Get all Student is active:
        //  Select *
        //  From
        //      users inner join userroles
        //      on user.UserID = role.UserID
        //  Where
        //      RoleID = 2
        //      and Status = 'Activated'
        public List<User> GetAllStudents()
        {
            var students = from user in ctx.Users
                           join role in ctx.UserRoles
                                on user.UserID equals role.UserID
                           where
                                role.RoleID == 2
                                && user.Status.Equals("Activated")
                           orderby
                                user.Username
                           select user;
            return students.ToList();
        }

        // Get all Student with name contain string:
        //  Select *
        //  From
        //      users inner join userroles
        //      on user.UserID = role.UserID
        //  Where
        //      RoleID = 2
        //      and Status = 'Activated'
        //      username like 
        //  orderby
        //      Username
        public List<User> SearchStudentsNameOnly(string studentName)
        {
            var students = from user in ctx.Users
                           join role in ctx.UserRoles
                                on user.UserID equals role.UserID
                           where
                                role.RoleID == 2
                                && user.Status.Equals("Activated")
                                && user.Username.Contains(studentName)
                           orderby
                                user.Username
                           select user;
            return students.ToList();
        }

        // SQL select student with studentID, name location, userName
        //  Select *
        //  From
        //      users inner join userroles
        //      on user.UserID = role.UserID
        //  Where
        //      RoleID = 2
        //      and Status = 'Activated'
        //      and UserID == userID
        //      and Username like @userName
        //      and LocationDetail like @location
        //  orderby
        //      Username
        public List<User> SearchStudents(string location, int userID, string userName)
        {
            var students = from user in ctx.Users
                           join loca in ctx.Locations 
                                on user.LocationID equals loca.LocationID
                           join role in ctx.UserRoles
                                on user.UserID equals role.UserID
                           where  
                                user.Status.Equals("Activated")
                                && role.RoleID == 2
                                && user.UserID == userID
                                && user.Username.Contains(userName)
                                && loca.LocationDetail.Contains(location)
                           orderby
                                user.Username
                           select user;
            return students.ToList();
        }

        // SQL select student with studentID, name location, userName
        //  Select *
        //  From
        //      users inner join userroles
        //      on user.UserID = role.UserID
        //  Where
        //      RoleID = 2
        //      and Status = 'Activated'
        //      and UserID == userID
        //      and Username like @userName
        //      and LocationDetail like @location
        //  orderby
        //      Username
        public List<User> SearchStudentsWithId(int userID)
        {
            var students = from user in ctx.Users
                           join loca in ctx.Locations
                                on user.LocationID equals loca.LocationID
                           join role in ctx.UserRoles
                                on user.UserID equals role.UserID
                           where
                                user.Status.Equals("Activated")
                                && role.RoleID == 2
                                && user.UserID == userID
                           orderby
                                user.Username
                           select user;
            return students.ToList();
        }

        // SQL select student with studentID, name location, userName
        //  Select *
        //  From
        //      users inner join userroles
        //      on user.UserID = role.UserID
        //  Where
        //      RoleID = 2
        //      and Status = 'Activated'
        //      and intership.Status == 'Activated'
        //      and StartTime < endDate
        //      and EndTime > endDate
        //  orderby
        //      Username
        public List<User> SearchStudentsInTime(DateTime startDate, DateTime endDate)
        {
            var students = from user in ctx.Users
                           join role in ctx.UserRoles
                                on user.UserID equals role.UserID
                           join intership in ctx.InterviewSchedules
                                on user.UserID equals intership.StudentID
                           where
                                user.Status.Equals("Activated")
                                && role.RoleID == 2
                                && intership.Status.Equals("Activated")
                                && intership.StartTime < endDate
                                && intership.EndTime > startDate
                           orderby
                                user.Username
                           select user;
            return students.ToList();
        }

        // SQL select student with studentID, name location, userName
        //  Select *
        //  From
        //      users inner join userroles
        //      on user.UserID = role.UserID
        //  Where
        //      RoleID = 2
        //      and Status = 'Activated'
        //      and intership.Status == 'Activated'
        //      and StartTime < @endDate
        //      and EndTime > @endDate
        //      and Username like @userName
        //      and LocationDetail like @location
        //  orderby
        //      Username
        public List<User> SearchStudentsDetail(DateTime startDate, DateTime endDate, string location, int userID, string userName)
        {
            var students = from user in ctx.Users
                           join role in ctx.UserRoles
                                on user.UserID equals role.UserID
                           join loca in ctx.Locations
                                on user.LocationID equals loca.LocationID
                           join intership in ctx.InterviewSchedules
                                on user.UserID equals intership.StudentID
                           where
                                user.Status.Equals("Activated")
                                && role.RoleID == 2
                                && intership.Status.Equals("Activated")
                                && intership.StartTime < endDate
                                && intership.EndTime > startDate
                                && user.Username.Contains(userName)
                                && loca.LocationDetail.Contains(location)
                           orderby
                                user.Username
                           select user;
            return students.ToList();
        }

        public void InsertStudent(User newStudent)
        {
            ctx.Users.Add(newStudent);
            UserRole role = new UserRole();
            role.UserID = newStudent.UserID;
            role.UserRoleID = 1;
            role.RoleID = 2;
            ctx.UserRoles.Add(role);
            ctx.SaveChanges();
        }

        public void UpdateStudent(User newStudent)
        {
            var studentsUpdate = ctx.Users.Single(user => user.UserID == newStudent.UserID);
            studentsUpdate = newStudent;
            ctx.SaveChanges();
        }

		public User GetUserByName(string username)
		{
			var user = ctx.Users.Where(u => u.Username == username).FirstOrDefault();
			return user;
		}
	}
}
