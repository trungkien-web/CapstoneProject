using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;

namespace Service
{
    public class CommonService : ICommonService
    {
        private ICommonRepository common = new CommonRepository();

        public List<string> GetAllNameData()
        {
            return common.GetAllNameData();
        }

        public DataSet GetDataByNameTable(string name)
        {
            return common.GetDataByNameTable(name);
        }

      
    }
}
