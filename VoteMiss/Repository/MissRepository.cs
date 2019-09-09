using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Repository
{
    public class MissRepository : IMissRepository
    {
        private MissVoteEntities ctx = new MissVoteEntities();
        public void AddMiss(Miss miss)
        {
            ctx.Misses.Add(miss);
            ctx.SaveChanges();
            
        }

        public void Delete(int missid)
        {
            Miss delete = ctx.Misses.FirstOrDefault(c => c.MissId == missid);
            List<Vote> vote = ctx.Votes.Where<Vote>(p => p.MissId == missid).ToList();
            List<Comment> com = ctx.Comments.Where<Comment>(p => p.MissId == missid).ToList();
            ctx.Votes.RemoveRange(vote);
            ctx.Comments.RemoveRange(com);
            ctx.Misses.Remove(delete);
            ctx.SaveChanges();
        }

        public List<Miss> GetAllMisses()
        {
            var allmiss = ctx.Misses.ToList();
            return allmiss;
        }

        public void UpdateMiss(Miss miss)
        {
            var current = ctx.Misses.FirstOrDefault(c => c.MissId == miss.MissId);
            
            current.MissName = miss.MissName;
            current.size1 = miss.size1;
            current.size2 = miss.size2;
            current.size3 = miss.size3;
            current.Adress = miss.Adress;
            ctx.SaveChanges();
        }
   
        public Miss GetByID(int missID) {
            return ctx.Misses.FirstOrDefault(C => C.MissId == missID);
        }

      
    }
}
