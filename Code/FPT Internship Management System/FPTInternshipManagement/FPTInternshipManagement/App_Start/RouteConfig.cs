using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FPTInternshipManagement
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "SearchAction",
                url: "Recruiter/SearchAction/{id}",
                defaults: new { controller = "Recruiter", action = "SearchAction", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "StudentProfile",
                url: "Student/MyProfile/{id}",
                defaults: new { controller = "Student", action = "MyProfile", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "StudentSaveExperience",
                url: "Student/SaveExperience/{id}",
                defaults: new { controller = "Student", action = "SaveExperience", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "StudentSaveAspiration",
                url: "Student/SaveAspiration/{id}",
                defaults: new { controller = "Student", action = "SaveAspiration", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "DelAspiration",
                url: "Student/DelAspiration/{id}",
                defaults: new { controller = "Student", action = "DelAspiration", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "StudentSaveSaveEditAspiration",
                url: "Student/SaveEditAspiration/{id}",
                defaults: new { controller = "Student", action = "SaveEditAspiration", id = UrlParameter.Optional }
            );


            routes.MapRoute(
                name: "StudentGetAspiration",
                url: "Student/GetAspiration/{id}",
                defaults: new { controller = "Student", action = "GetAspiration", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                    name: "Recruit",
                    url: "Recruit",
                    defaults: new { controller = "Recruiter", action = "Index", id = UrlParameter.Optional }
                );

            routes.MapRoute(
                name: "RecruitUpdate",
                url: "Recruit/MyProfile/{id}",
                defaults: new { controller = "Recruiter", action = "MyProfile", id = UrlParameter.Optional }
            );


            routes.MapRoute(
                name: "RecruitJob",
                url: "Recruit/Job/{id}",
                defaults: new { controller = "Recruiter", action = "Job", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "RecruitAddJob",
                url: "Recruit/AddJob/{id}",
                defaults: new { controller = "Recruiter", action = "AddJob", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "RecruitDelJob",
                url: "Recruit/DelJob/{id}",
                defaults: new { controller = "Recruiter", action = "DelJob", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "ApplyJob",
                url: "Home/ApplyJob/{id}",
                defaults: new { controller = "Home", action = "ApplyJob", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "StudentJob",
                url: "Student/ApplyJob/{id}",
                defaults: new { controller = "Student", action = "ApplyJob", id = UrlParameter.Optional }
            );


            routes.MapRoute(
                name: "MyAspiration",
                url: "Student/MyAspiration/{id}",
                defaults: new { controller = "Student", action = "MyAspiration", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "SearchJob",
                url: "Home/SearchJob/{id}",
                defaults: new { controller = "Home", action = "SearchJob", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "MySkill",
                url: "Student/MySkill/{id}",
                defaults: new { controller = "Student", action = "MySkill", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Recommend",
                url: "Student/Recommend/{id}",
                defaults: new { controller = "Student", action = "Recommend", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "MyJob",
                url: "Student/MyJob/{id}",
                defaults: new { controller = "Student", action = "MyJob", id = UrlParameter.Optional }
            );


            routes.MapRoute(
                name: "StudentDelExperience",
                url: "Student/DelExperience/{id}",
                defaults: new { controller = "Student", action = "DelExperience", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "RecruiterAccept",
                url: "Recruiter/Accept/{id}",
                defaults: new { controller = "Recruiter", action = "Accept", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "RecruiterReject",
                url: "Recruiter/Reject/{id}",
                defaults: new { controller = "Recruiter", action = "Reject", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "RecruitAddJobSub",
                url: "Recruit/AddJobSub/{id}",
                defaults: new { controller = "Recruiter", action = "AddJobSub", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "RecruitDelJobSub",
                url: "Recruit/DelJobSub/{id}",
                defaults: new { controller = "Recruiter", action = "DelJobSub", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "AdminSearchUser",
                url: "Admin/SearchUser/{id}",
                defaults: new { controller = "Admin", action = "SearchUser", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "AdminReject",
                url: "Admin/Reject/{id}",
                defaults: new { controller = "Admin", action = "Reject", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "AdminAccept",
                url: "Admin/Accept/{id}",
                defaults: new { controller = "Admin", action = "AddJobSub", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "AdminDel",
                url: "Admin/Del/{id}",
                defaults: new { controller = "Admin", action = "DelJobSub", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "AdminAddNew",
                url: "Admin/AddNew/{id}",
                defaults: new { controller = "Admin", action = "AddNew", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "StaffSearch",
                url: "Staff/AccountSearch/{id}",
                defaults: new { controller = "Staff", action = "AccountSearch", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "StaffAcceptAps",
                url: "Staff/AcceptAspiration/{id}",
                defaults: new { controller = "Staff", action = "AcceptAspiration", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "AdminSaveNot",
                url: "Admin/SaveNot/{id}",
                defaults: new { controller = "Admin", action = "SaveNot", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "AdminDelNot",
                url: "Admin/DelNot/{id}",
                defaults: new { controller = "Admin", action = "DelNot", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "AdminViewNot",
                url: "Admin/ViewNot/{id}",
                defaults: new { controller = "Admin", action = "ViewNot", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Notifydetail",
                url: "Home/NotifyDetail/{id}",
                defaults: new { controller = "Home", action = "NotifyDetail", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "RecruiterSaveFeedback",
                url: "Recruiter/SaveFeedback/{id}",
                defaults: new { controller = "Recruiter", action = "SaveFeedback", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "StudentSaveFeedback",
                url: "Student/SaveFeedback/{id}",
                defaults: new { controller = "Student", action = "SaveFeedback", id = UrlParameter.Optional }
            );


            routes.MapRoute(
            name: "RecruiterSaveReport",
            url: "Recruiter/SaveReport/{id}",
            defaults: new { controller = "Recruiter", action = "SaveReport", id = UrlParameter.Optional }
            );

            routes.MapRoute(
            name: "StaffDownloadExcelAccount",
            url: "Staff/DownloadExcelAccount/{id}",
            defaults: new { controller = "Recruiter", action = "DownloadExcelAccount", id = UrlParameter.Optional }
            );

            
        }
    }
}
