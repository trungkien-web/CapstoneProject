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
    }
}

