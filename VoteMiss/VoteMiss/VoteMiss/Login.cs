using System;
using Service;
using System.Windows.Forms;
using Model;
using System.Collections.Generic;

namespace VoteMiss
{
    public partial class Login : Form
    {
        private IUserService service = new UserService();
         
        public Login()
        {
            InitializeComponent();
            txtUseName.Text = LoggedUser.Username;
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            List<User> listUser = service.getUser();
            bool check = false;
            foreach(User user in listUser)
            {
                if(user.UserName==txtUseName.Text && user.Pass == txtPass.Text)
                {
                    if (user.Role== "Admin") {             
                        LoggedUser.Username = user.UserName;
                        LoggedUser.Password = user.Pass;
                        LoggedUser.UserID = user.UserID;
                        FormAdmin form = new FormAdmin();
                        form.Show();
                        this.Hide();
                        check = true;
                        break;
                    }
                    else
                    {
                        LoggedUser.Username = user.UserName;
                        LoggedUser.Password = user.Pass;
                        LoggedUser.UserID = user.UserID;
                        FormUser userForm = new FormUser();
                        userForm.Show();
                        this.Hide();
                        check = true;
                        break;
                    }
                }
               
            }
            if (check == false)
            {
                MessageBox.Show("Invalid UserName or Password");
            }
             
        }

        private void Login_Load(object sender, EventArgs e)
        {

        }
    }
}
