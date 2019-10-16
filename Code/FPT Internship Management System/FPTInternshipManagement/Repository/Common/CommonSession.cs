using FPTInternshipManagement.Common;
using Helper;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Repository.Common
{
	public static class CommonSession
	{
		public static Boolean SESSION_ROLE_RECRUITMENT()
		{
			var user = (UserSession)(SessionHelper.GetSession());
			if (HttpContext.Current.Session[CommonConstants.SESSION_LOGGED] != null && user.Role == CommonConstants.RECRUITER_ROLE)
			{
				return true;
			}
			return false;
		}

		public static Boolean SESSION_ROLE_STUDENT()
		{
			var user = (UserSession)(SessionHelper.GetSession());
			if (HttpContext.Current.Session[CommonConstants.SESSION_LOGGED] != null && user.Role == CommonConstants.STUDENT_ROLE)
			{
				return true;
			}
			return false;
		}

		public static Boolean SESSION_ROLE_ADMIN()
		{
			var user = (UserSession)(SessionHelper.GetSession());
			if (HttpContext.Current.Session[CommonConstants.SESSION_LOGGED] != null && user.Role == CommonConstants.ADMIN_ROLE)
			{
				return true;
			}
			return false;
		}
	}
}