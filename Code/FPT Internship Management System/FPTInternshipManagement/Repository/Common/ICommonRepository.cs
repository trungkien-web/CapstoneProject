using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;


namespace Repository
{
    public interface ICommonRepository
    {
        List<string> GetAllNameData(); 
        DataSet GetDataByNameTable(string name);
    }
}
