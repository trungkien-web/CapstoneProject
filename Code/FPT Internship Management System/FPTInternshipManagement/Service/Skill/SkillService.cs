using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
	public class SkillService : ISkillService
	{
		ISkillRepository repository = new SkillRepository();
		public List<Skill> GetAllSkills()
		{
			return repository.GetAllSkills();
		}

		public Skill GetSkillById(int id)
		{
			return repository.GetSkillById(id);
		}

        //get skill by departmentID
		public List<Skill> GetSkillsByDepartmentId(int id)
		{
			return repository.GetSkillsByDepartmentId(id);
		}
	}
}
