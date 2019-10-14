using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
	public class DepartmentService : IDepartmentService
	{
		IDepartmentRepository departmentRepository = new DepartmentRepository();

		public Dictionary<string, string> GetToDictionaryHome()
		{
			return departmentRepository.GetToDictionaryHome();
		}
	}
}
