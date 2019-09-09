using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Repository
{
    public interface IVoteRepository
    {
        int countVote(int? missID);
        List<Vote> getAllVote();
        void AddVote(Vote vote);
        
        
    }
}
