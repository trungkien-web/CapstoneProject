using Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FPTInternshipManagement.Models
{
	public class ExViewModel
	{
		public int IdEx { get; set; }
		public string skill { get; set; }
		public string Des { get; set; }
	}
}