
using System.Web.Mvc;
using Service;
using Helper;


namespace WebMissVote.Controllers
{
    public class LogginController : Controller
    {
        // GET: Loggin
        private IUserService service = new UserService();
        public ActionResult DoLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DoLogin(string username ,string password)
        {
            var user = service.Login(username, password);
            if (user != null)
            {
                SessionHelper.SetSession(new UserSession { UserID = user.UserID, Name =user.UserName});
                return Redirect("/misses");
            }
            else
            {
                ViewBag.ErrorMessage = "Login Fail";
                return View();

            }

        }

    }
}