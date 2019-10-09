﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;


namespace Repository
{
    public interface IDepartmentRepository
    {
        List<Department> GetAllDepartment();
		Dictionary<int, List<Skill>> GetToDictionary();
		List<Skill> GetAllSkill();

	}
}
