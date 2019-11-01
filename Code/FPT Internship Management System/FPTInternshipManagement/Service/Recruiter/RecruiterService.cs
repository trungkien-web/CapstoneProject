using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
    public class RecruiterService:IRecruiterService
    {
        IUserRepository userRepo = new UserRepository();

        public List<User> searchStudents(DateTime startDate, DateTime endDate, string studentID, string location, string studentName)
        {
            if (startDate.Equals(null) && endDate.Equals(null) && string.IsNullOrEmpty(studentID) && string.IsNullOrEmpty(location) && string.IsNullOrEmpty(studentName))
            {
                return userRepo.GetAllStudents();
            }

            if (startDate.Equals(null) && endDate.Equals(null) && !string.IsNullOrEmpty(studentID) && string.IsNullOrEmpty(location) && string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudentsWithId(int.Parse(studentID));
            }

            if (startDate.Equals(null) && endDate.Equals(null) && !string.IsNullOrEmpty(studentID) && !string.IsNullOrEmpty(location) || !string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudents(location, int.Parse(studentID), studentName);
            }

            if (!startDate.Equals(null) && !endDate.Equals(null) && string.IsNullOrEmpty(studentID) && string.IsNullOrEmpty(location) && string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudentsInTime(startDate, endDate);
            }

            if (!startDate.Equals(null) && !endDate.Equals(null) && !string.IsNullOrEmpty(studentID) && !string.IsNullOrEmpty(location) && !string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudentsDetail(startDate, endDate, location, int.Parse(studentID), studentName);
            }

            return null;
        }

        public void InsertStudent(User newStudent)
        {
            userRepo.InsertStudent(newStudent);
        }

        public void UpdateStudent(User newStudent)
        {
            userRepo.UpdateStudent(newStudent);
        }
    }
}
