using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Service
{
    public interface IRecruiterService
    {
        List<User> searchStudents(string startDate, string endDate, string studentID, string location, string studentName);

        void InsertStudent(User newStudent);

        void UpdateStudent(User newStudent);
    }
}
