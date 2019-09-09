using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository;

namespace Service
{
    public class UserService : IUserService
    {
        private IUserRepository repository = new UserReponsitory();

        public void addUser(User user)
        {
            repository.addUser(user);
        }

        public void Delete(int userID)
        {
            repository.Delete(userID);
        }

        public User GetByID(int userID)
        {
            return repository.GetByID(userID);
        }

        public List<User> getUser()
        {
            return repository.GetUser();
        }


        public User Login(string user, string pass)
        {
            return repository.Login(user, pass);
        }

        public void UpdateUser(User user)
        {
            repository.UpdateUser(user);
        }
    }
}
