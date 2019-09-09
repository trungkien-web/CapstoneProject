
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace Repository
{
    public class CommentRepository : ICommentRepository
    {

        private MissVoteEntities ctx = new MissVoteEntities();

        public void AddComment(Comment comment)
        {
            ctx.Comments.Add(comment);
            ctx.SaveChanges();
        }

        public int countComment(int missID)
        {
            int countComment = (from c in ctx.Comments
                                join m in ctx.Misses on c.MissId equals m.MissId
                                where m.MissId == missID
                                select c).Count();
            return countComment;
        }

        public List<Comment> GetAllComment()
        {
            var allComment = ctx.Comments.ToList();
            return allComment;
        }

        public ArrayList getCom()
        {
            var comment = from c in ctx.Comments
                          join m in ctx.Misses on c.MissId equals m.MissId
                          join u in ctx.Users on c.UserId equals u.UserID
                          select new { u.UserName, c.Content };
            ArrayList a = new ArrayList();
            a.Add(comment);
            
            return a;

        }
    }
}
