using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data.Entity;

namespace Repository
{
	public class DepartmentRepository : IDepartmentRepository
	{
		private RecruitmentSystemEntities ctx = new RecruitmentSystemEntities();
		public List<Department> GetAllDepartment()
		{
			var list = ctx.Departments.ToList();
			return list;
		}

		public List<Skill> GetAllSkill()
		{
			var list = ctx.Skill.ToList();
			return list;
		}

		public Dictionary<int, List<Skill>> GetToDictionary()
		{
			Dictionary<int, List<Skill>> skillKeyValuePair = new Dictionary<int, List<Skill>>();
			
			foreach (Department department in GetAllDepartment())
			{
				List<Skill> skills = new List<Skill>();
				foreach(Skill skill in GetAllSkill())
				{
					if(skill.DepartmentID == department.DepartmentID)
					{
						skills.Add(skill);
						
					}
				}
				skillKeyValuePair.Add(department.DepartmentID, skills);
			}

				return skillKeyValuePair;
		}
	}
}

