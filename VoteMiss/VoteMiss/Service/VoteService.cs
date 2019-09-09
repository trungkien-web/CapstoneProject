using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Service
{
    public class VoteService : IVoteService
    {
        private IVoteRepository repository = new VoteRespository();

        public void addVote(Vote vote)
        {
             repository.AddVote(vote);
        }

        public int countVote(int? missID)
        {
            return repository.countVote(missID);
        }

        public List<Vote> getAllVote()
        {
            return repository.getAllVote();
        }
    }
}
