using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public interface IDepartmentRepository
	{
		List<Department> GetAllDepartments();
		Dictionary<int, List<Skill>> GetToDictionary();
		Department GetDepartmentById(int id);
		Dictionary<string, string> GetToDictionaryHome();
	}
}
