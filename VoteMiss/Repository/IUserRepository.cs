using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public interface IUserRepository
    {
        List<User> GetUser();
        User Login(string user, string pass);
        User GetByID(int userID);
        void addUser(User user);
        void UpdateUser(User user);
        void Delete(int userID);

    }
}
