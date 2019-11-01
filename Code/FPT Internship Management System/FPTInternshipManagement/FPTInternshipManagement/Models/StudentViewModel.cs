using Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Models
{
	public class StudentViewModel
	{
		[Required]
		public IList<Department> GetAllDepartment { get; set; }
		public IList<SelectListItem> SelectListItems { get; set; }
		public IList<string> SelectedSkills { get; set; }
		public IList<SelectListItem> AvailableSkills { get; set; }
		public int SelectedDepartmentId { get; set; }
		public StudentViewModel()
		{
			GetAllDepartment = new List<Department>();
			SelectListItems = new List<SelectListItem>();
			SelectedSkills = new List<string>();
			AvailableSkills = new List<SelectListItem>();
		}
		
	}
}