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

        public List<User> searchStudents(string startDate, string endDate, string studentID, string location, string studentName)
        {
            if (string.IsNullOrEmpty(startDate) && string.IsNullOrEmpty(endDate) && string.IsNullOrEmpty(studentID) && string.IsNullOrEmpty(location) && string.IsNullOrEmpty(studentName))
            {
                return userRepo.GetAllStudents();
            }

            if (startDate.Equals(null) && endDate.Equals(null) && !string.IsNullOrEmpty(studentID) && string.IsNullOrEmpty(location) && string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudentsWithId(int.Parse(studentID));
            }

            if (startDate.Equals(null) && endDate.Equals(null) && !string.IsNullOrEmpty(studentID) && !string.IsNullOrEmpty(location) || !string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudents(location, studentID, studentName);
            }

            if (startDate.Equals(null) && endDate.Equals(null) && string.IsNullOrEmpty(studentID) && !string.IsNullOrEmpty(location) || string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudents(location, studentID, studentName);
            }

            if (!startDate.Equals(null) && !endDate.Equals(null) && string.IsNullOrEmpty(studentID) && string.IsNullOrEmpty(location) && string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudentsInTime(DateTime.Parse(startDate), DateTime.Parse(endDate));
            }

            if (!startDate.Equals(null) && !endDate.Equals(null) && !string.IsNullOrEmpty(studentID) && !string.IsNullOrEmpty(location) && !string.IsNullOrEmpty(studentName))
            {
                return userRepo.SearchStudentsDetail(DateTime.Parse(startDate), DateTime.Parse(endDate), location, int.Parse(studentID), studentName);
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
