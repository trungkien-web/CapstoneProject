using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
	public interface ICommonService
    {
        DataSet GetDataByNameTable(string name);
        List<string> GetAllNameData();
    }
}
