using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
	public class DepartmentService : IDepartmentService
	{
		private IDepartmentRepository departmentRepository = new DepartmentRepository();

        public List<Department> GetAllDepartments()
        {
            return departmentRepository.GetAllDepartment();
        }

		public Dictionary<int, List<Skill>> GetToDictionary()
		{
			return departmentRepository.GetToDictionary();
		}
	}
}
