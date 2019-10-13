using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Model;
using System.Reflection;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.OleDb;
using System.IO;
using OfficeOpenXml;
using OfficeOpenXml.Table;

namespace RecruimentSystem.Controllers
{
    public class CommonController : Controller
    {
        private ICommonService service = new CommonService();
        // GET: Common
        public ActionResult Index()
        {
            using (var Mydb = new RecruitmentSystemEntities())
            {
                

                List<string> tbllistname = new List<string>();
                tbllistname = service.GetAllNameData();
                ViewBag.MyTables = tbllistname; 
            }

            return View();
        }

        [HttpPost]
        [ActionName("ExcelExportByName")]
        public ActionResult ExcelExportByName()
        {

            string tableName = Request.Form["tableName"];
            //Fill dataset with records
            DataSet dataSet = service.GetDataByNameTable(tableName);

            StringBuilder sb = new StringBuilder();

            sb.Append("<table>");

            //LINQ to get Column names
            var columnName = dataSet.Tables[0].Columns.Cast<DataColumn>()
                                 .Select(x => x.ColumnName)
                                 .ToArray();
            sb.Append("<tr>");
            //Looping through the column names
            foreach (var col in columnName)
                sb.Append("<td>" + col + "</td>");
            sb.Append("</tr>");

            //Looping through the records
            foreach (DataRow dr in dataSet.Tables[0].Rows)
            {
                sb.Append("<tr>");
                foreach (DataColumn dc in dataSet.Tables[0].Columns)
                {
                    sb.Append("<td>" + dr[dc] + "</td>");
                }
                sb.Append("</tr>");
            }

            sb.Append("</table>");

            //Choose one of these: as the contentType
            //Excel 2003 : "application/vnd.ms-excel"
            //Excel 2007 : "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" 
            //Writing StringBuilder content to an excel file.
            Response.Clear();
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            Response.Buffer = true;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=" + tableName + ".xls");
            Response.Write(sb.ToString());
            Response.Flush();
            Response.Close();
            return View();
        }
       

        [HttpPost]
        public ActionResult ImportExcel(HttpPostedFileBase postedFile)
        {
            string filePath = string.Empty;
            if (postedFile != null)
            {
                string path = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                filePath = path + Path.GetFileName(postedFile.FileName);
                string extension = Path.GetExtension(postedFile.FileName);
                postedFile.SaveAs(filePath);

                string conString = string.Empty;
                switch (extension)
                {
                    case ".xls": //Excel 97-03.
                        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                        break;
                    case ".xlsx": //Excel 07 and above.
                        conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                        break;
                }

                DataTable dt = new DataTable();
                conString = string.Format(conString, filePath);
                string sheetName;
                using (OleDbConnection connExcel = new OleDbConnection(conString))
                {
                    using (OleDbCommand cmdExcel = new OleDbCommand())
                    {
                        using (OleDbDataAdapter odaExcel = new OleDbDataAdapter())
                        {
                            cmdExcel.Connection = connExcel;

                            //Get the name of First Sheet.
                            connExcel.Open();
                            DataTable dtExcelSchema;
                            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                             sheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
                            
                            connExcel.Close();

                            //Read Data from First Sheet.
                            connExcel.Open();
                            cmdExcel.CommandText = "SELECT * From [" + sheetName + "]";
                            odaExcel.SelectCommand = cmdExcel;
                            odaExcel.Fill(dt);
                            connExcel.Close();
                        }
                    }
                }
                sheetName = sheetName.Remove(sheetName.Trim().Length - 1);
                RecruitmentSystemEntities ctx = new RecruitmentSystemEntities();
                conString = ctx.Database.Connection.ConnectionString;
                using (SqlConnection con = new SqlConnection(conString))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        sqlBulkCopy.DestinationTableName = sheetName;
                        con.Open();
                        sqlBulkCopy.WriteToServer(dt);
                        con.Close();
                    }
                }
            }

            return View("Index");
        }

    }
}
