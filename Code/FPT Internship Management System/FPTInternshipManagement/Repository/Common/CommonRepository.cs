using System.Collections.Generic;
using Model;
using System.Data.SqlClient;
using System.Data;

namespace Repository
{
    public class CommonRepository : ICommonRepository
    {
        private FPTInternshipManagermentEntities ctx = new FPTInternshipManagermentEntities();

        public List<string> GetAllNameData()
        {
            List<string> nameData = new List<string>();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ctx.Database.Connection.ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select table_name from FptInternshipManagerment.INFORMATION_SCHEMA.TABLES where TABLE_TYPE = 'BASE TABLE'";
            cmd.Connection = conn;
            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string rec = null;
                for (int i = 0; i <= reader.FieldCount - 1; i++) //The mathematical formula for reading the next fields must be <=
                {
                    rec = reader.GetString(i);
                }
                nameData.Add(rec);
            }
            conn.Close();
            return nameData;
        }

        public DataSet GetDataByNameTable(string name)
        {
            DataSet dataSet = new DataSet();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ctx.Database.Connection.ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from "+name;
            cmd.Connection = conn;

            SqlDataAdapter sqldataadapter = new SqlDataAdapter();
            sqldataadapter.SelectCommand = cmd;
            sqldataadapter.Fill(dataSet);

            return dataSet;
        }
    }
}

