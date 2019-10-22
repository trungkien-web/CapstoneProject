using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Models
{
	public class SkillViewModel
	{
		public int SkillID { get; set; }
		public string SkillName { get; set; }
		public List<SkillViewModel> GetSkillViewModels { get; set; }
		public int[] SkillList { get; set; }
	}
}