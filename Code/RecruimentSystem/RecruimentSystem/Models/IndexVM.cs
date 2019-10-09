using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;

namespace RecruimentSystem.Models
{
	public class IndexVM
	{
		public List<Department> departments { get; set; }
		public Dictionary<int,List<Skill>> skillKeyValuePair { get; set; }
	}
}