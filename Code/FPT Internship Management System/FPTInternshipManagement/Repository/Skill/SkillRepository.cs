using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
	public class SkillRepository : ISkillRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();

		public List<Skill> GetAllSkills()
		{
			var list = ctx.Skills.ToList();
			return list;
		}

		public Skill GetSkillById(int id)
		{
			var skill = ctx.Skills.Where(s => s.SkillID == id).FirstOrDefault<Skill>();
			return skill;
		}

		public List<Skill> GetSkillsByDepartmentId(int id)
		{
			List<Skill> skills = new List<Skill>();
			var skillList = ctx.SkillLists.Where(s => s.DepartmentID == id).ToList();
			foreach (SkillList sl in skillList)
			{
				skills.Add(GetSkillById(sl.SkillID));
			}
			return skills;
		}
	}
}
