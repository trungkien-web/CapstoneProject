using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public interface ICommentService
    {
        //string getAllComment(int missID);
        void AddComment(Comment comment);
        List<Comment> GetAllComment();
        int countComment(int missID);
    }
}
