using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Repository
{
	public class DepartmentRepository : IDepartmentRepository
	{
		FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();
		public List<Department> GetAllDepartments()
		{
			var list = ctx.Departments.ToList();
			return list;
		}

		public Department GetDepartmentById(int id)
		{
			var department = ctx.Departments.Where(d => d.DepartmentID == id).FirstOrDefault<Department>();
			return department;
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
			foreach(SkillList sl  in skillList)
			{
				skills.Add(GetSkillById(sl.SkillID));
			}
			return skills;
		}

		public Dictionary<int, List<Skill>> GetToDictionary()
		{
			Dictionary<int, List<Skill>> keyValuePairs = new Dictionary<int, List<Skill>>();
			foreach (Department department in GetAllDepartments())
			{
				keyValuePairs.Add(department.DepartmentID, GetSkillsByDepartmentId(department.DepartmentID));
			}
			return keyValuePairs;
		}

		public Dictionary<string, string> GetToDictionaryHome()
		{
			Dictionary<string, string> keyValuePairs = new Dictionary<string, string>();
			foreach (var keyValues in GetToDictionary())
			{
				var nameList =from kp in keyValues.Value select kp.SkillName;
				string combindedString = string.Join(",", nameList.Take(5));
				combindedString += "...";
				keyValuePairs.Add(GetDepartmentById(keyValues.Key).DepartmentName, combindedString);
			}
			return keyValuePairs;
		}
	}
}
