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
		public IList<Skill> GetAllSkills { get; set; }
		public IList<SelectListItem> SelectListItems { get; set; }
		public IList<Skill> SelectedSkills { get; set; }
		public IList<SelectListItem> AvailableSkills { get; set; }
		public int SelectedDepartmentId { get; set; }
		public int SelectedSkillId { get; set; }
		public StudentViewModel()
		{
			GetAllDepartment = new List<Department>();
			SelectListItems = new List<SelectListItem>();
			SelectedSkills = new List<Skill>();
			AvailableSkills = new List<SelectListItem>();
			GetAllSkills = new List<Skill>();

		}
		public StudentViewModel(StudentViewModel model)
		{
			GetAllDepartment = model.GetAllDepartment;
			GetAllSkills = model.GetAllSkills;
			SelectListItems = model.SelectListItems;
			AvailableSkills = model.AvailableSkills;
			SelectedDepartmentId = model.SelectedDepartmentId;
			SelectedSkillId = model.SelectedSkillId;
			SelectedSkills = model.SelectedSkills;
		}

	}
}