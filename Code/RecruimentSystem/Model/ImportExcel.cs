using ImportExcel.Class;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace ImportExcel.Models
{
    public class ImportExcel
    {
        [Required(ErrorMessage = "Please select file")]
        [FileExt(Allow = ".xls,.xlsx", ErrorMessage = "Only excel file")]
        public HttpPostedFileBase file { get; set; }
    }
}