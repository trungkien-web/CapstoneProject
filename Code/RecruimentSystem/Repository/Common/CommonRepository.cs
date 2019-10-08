using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data.Entity;
using System.Data.SqlClient;

namespace Repository
{
    public class CommonRepository : ICommonRepository
    {
        

        public List<string> GetAllNameTable()
        {
            SqlConnection cn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            cn.ConnectionString = "ConnectionString";
            List<string> listNameTable = new List<string>();
            cmd.Connection = cn;
            cmd.Connection.Open();
            cmd.CommandText = "SELECT table_name FROM INFORMATION_SCHEMA.Tables WHERE table_type='BASE TABLE'";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                listNameTable.Add(dr.GetValue(0).ToString());
            }
            return listNameTable;

        }
    }
}

