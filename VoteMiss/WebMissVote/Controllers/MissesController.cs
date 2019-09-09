using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model;
using Service;
using System.IO;
using Helper;

namespace WebMissVote.Controllers
{
    public class MissesController : Controller
    {

        private IMissService missService = new MissService();
        private IVoteService voteService = new VoteService();
        private ICommentService comService = new CommentService();

        // GET: Misses
        public ActionResult Index()
        {
            if (Session["loggeduser"] != null)
            {
                var misses = missService.GetAllMisses();
                return View(misses);
            }
            else
            {
                return Redirect("/loggin/dologin");
            }

        }

        // GET: Misses/Details/5
        public ActionResult Details(int? id, Vote vote)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Miss miss = missService.GetByID(id.Value);
            if (miss == null)
            {
                return HttpNotFound();
            }
            var user = (UserSession)SessionHelper.GetSession();

            if(user == null)
            {
                return Redirect("/loggin/dologin");
               
            }
            
            if (ModelState.IsValid)
            {
                List<Vote> listVote = voteService.getAllVote();
                foreach (Vote item in listVote)
                {
                    if (item.UserId == user.UserID && item.MissId == id)
                    {
                        TempData["voted"] = "<script>$(document).ready(function() {$('#btnVote').hide();});</script>";
                        //ViewBag.Voted = true;
                        break;

                    }
                }
            }
            ViewBag.Vote = voteService.countVote(id);

            return View(miss);
        }

        // GET: Misses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Misses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Miss miss)
        {
            var imageUrl = string.Empty;
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];
                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/Img/"), fileName);
                    file.SaveAs(path);
                    imageUrl = fileName;
                }

            }
            if (ModelState.IsValid)
            {
                miss.Image = imageUrl;
                missService.AddMiss(miss);

                return RedirectToAction("Index");
            }


            return View(miss);
        }

        // GET: Misses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Miss miss = missService.GetByID(id.Value);
            if (miss == null)
            {
                return HttpNotFound();
            }
            return View(miss);
        }

        // POST: Misses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MissId,MissName,Image,Birthdate,Size1,Size2,Size3,Adress")] Miss miss)
        {

            if (ModelState.IsValid)
            {
                missService.UpdateMiss(miss);

                return RedirectToAction("Index");
            }
            return View(miss);
        }

        // GET: Misses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Miss miss = missService.GetByID(id.Value);
            if (miss == null)
            {
                return HttpNotFound();
            }
            return View(miss);
        }

        // POST: Misses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            missService.Delete(id);
            return RedirectToAction("Index");
        }

        public ActionResult CreateVote([Bind(Include = "UserId,MissId")] Vote vote)
        {
   
            voteService.addVote(vote);
            return RedirectToAction("Details", new { id = vote.MissId });
            

        }

    


        public ActionResult Comment([Bind(Include = "UserId,MissId,Content")] Comment com)
        {
            if (ModelState.IsValid)
            {
                
                comService.AddComment(com);

                return RedirectToAction("Details", new { id = com.MissId });
            }


            return View(com);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                //missService.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
