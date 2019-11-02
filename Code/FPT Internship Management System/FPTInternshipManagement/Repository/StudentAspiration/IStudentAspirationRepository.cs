using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public interface IStudentAspirationRepository
	{
		void InsertStudentAspiration(Aspiration aspiration, int userId, List<string> listId);
		//add AspirationId to user table
		void InsertStudentAspirationId(int id, int userId);
		Boolean CheckAspiration(int userId);
		Aspiration GetAspirationById(int id);
		void InsertListSkillsAspiration(List<string> listId, int aspirationId);
	}
}
