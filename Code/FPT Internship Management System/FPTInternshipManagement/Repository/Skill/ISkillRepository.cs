using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public interface ISkillRepository
	{
		List<Skill> GetAllSkills();
		Skill GetSkillById(int id);
		List<Skill> GetSkillsByDepartmentId(int id);
	}
}
