using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class UserReponsitory : IUserRepository
    {
        private MissVoteEntities ctx = new MissVoteEntities();

        public void addUser(User user)
        {
            ctx.Users.Add(user);
            ctx.SaveChanges();
        }

        public List<User> GetUser()
        {
            var allUser = ctx.Users.ToList();
            return allUser;
        }

        public User Login(string user, string pass)
        {
            var existed = ctx.Users.FirstOrDefault(c => c.UserName == user && c.Pass == pass);
            return existed;

        }
        public User GetByID(int userID)
        {
            return ctx.Users.FirstOrDefault(C => C.UserID == userID);
        }

        public void UpdateUser(User user)
        {
            var current = ctx.Users.FirstOrDefault(c => c.UserID == user.UserID);
            
            current.UserName = user.UserName;
            current.Role = user.Role;
            current.Pass = user.Pass;
            ctx.SaveChanges();
        }

        public void Delete(int userID)
        {
            User user = ctx.Users.FirstOrDefault(u => u.UserID == userID);
            ctx.Users.Remove(user);
            ctx.SaveChanges();
        }
    }
}
