using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    //
	public interface ISkillService
	{
		List<Skill> GetAllSkills();
		Skill GetSkillById(int id);

        //get skill by department
		List<Skill> GetSkillsByDepartmentId(int id);
	}
}
