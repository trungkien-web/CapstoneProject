using System;
using System.Collections.Generic;
using System.Linq;
using Model;
using Repository;

namespace Service
{
    public class MissService :IMissService
    {
        private IMissRepository repository = new MissRepository();

        public void AddMiss(Miss miss)
        {
            repository.AddMiss(miss);
        }

        public void UpdateMiss(Miss miss)
        {
            repository.UpdateMiss(miss);
        }

        public List<Miss> GetAllMisses()
        {
            return repository.GetAllMisses();
        }

        public void Delete(int missid)
        {
            repository.Delete(missid);
        }
        public Miss GetByID(int missID)
        {
            return repository.GetByID(missID);
        }

    
       
    }

  
}
