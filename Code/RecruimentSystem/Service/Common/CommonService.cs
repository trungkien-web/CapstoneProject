using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
	public class CommonService : ICommonService
    {
		private ICommonRepository tableData = new CommonRepository();

        public List<string> GetAllNameTable()
        {
            return tableData.GetAllNameTable();
        }
    }
}
