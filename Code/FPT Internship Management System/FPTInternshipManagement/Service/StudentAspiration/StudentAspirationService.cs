using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
	public class StudentAspirationService : IStudentAspirationService
	{
        //get Aspiration by Student
        IStudentAspirationRepository repository = new StudentAspirationRepository();

		public void InsertStudentAspiration(Aspiration aspiration, int userId, List<string> listId)
		{
			repository.InsertStudentAspiration(aspiration, userId, listId);
		}
	}
}
