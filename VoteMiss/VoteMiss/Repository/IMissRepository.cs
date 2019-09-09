using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Repository
{
    public interface IMissRepository
    {
        void AddMiss(Miss miss);
        void UpdateMiss(Miss miss);
        List<Miss> GetAllMisses();
        void Delete(int missid);
        Miss GetByID(int missID);

        
    }

    
}
