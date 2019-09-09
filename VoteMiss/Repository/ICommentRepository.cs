using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Collections;


namespace Repository
{
    public interface ICommentRepository
    {
        //List<string> getAllComment(int missID);
        void AddComment( Comment comment);
        List<Comment> GetAllComment();
        int countComment(int missID);
        ArrayList getCom();
    }
}
