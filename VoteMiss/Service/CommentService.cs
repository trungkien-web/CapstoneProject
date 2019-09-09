using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Repository;

namespace Service
{
    public class CommentService : ICommentService
    {
        private ICommentRepository repository = new CommentRepository();

        public void AddComment(Comment comment)
        {
             repository.AddComment(comment);
        }

        public int countComment(int missID)
        {
            return repository.countComment(missID);
        }

        public List<Comment> GetAllComment()
        {
            return repository.GetAllComment();
        }
        //public string getAllComment(int missID)
        //{
        //      return repository.getAllComment(missID);
        //}



    }
}
