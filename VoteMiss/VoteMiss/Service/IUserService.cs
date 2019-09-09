using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public interface IUserService
    {
        List<User> getUser();
        void addUser(User user);
        User Login(string user,string pass);
        User GetByID(int userID);
        void UpdateUser(User user);

        void Delete(int userID);
    }
}
