
using System;
using System.Collections.Generic;
using System.Linq;

using Model;

namespace Repository
{
    public class VoteRespository : IVoteRepository
    {
        private MissVoteEntities ctx = new MissVoteEntities();

        public void AddVote(Vote vote)
        {
            ctx.Votes.Add(vote);
            ctx.SaveChanges();
        }

        public int countVote(int? missID)
        {
          int coutVote = (from s in ctx.Misses 
                        join r in ctx.Votes on s.MissId equals r.MissId
                        where s.MissId == missID
                        select s).Count();
            return coutVote;
        }

        

        public List<Vote> getAllVote()
        {
            var allVote = ctx.Votes.ToList();
            return allVote;
        }
    }
}
