using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Service
{
    public interface IVoteService
    {
        int countVote(int? missID);
        List<Vote> getAllVote();
        void addVote(Vote vote);
    }
}
