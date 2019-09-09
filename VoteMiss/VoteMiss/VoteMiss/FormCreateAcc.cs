using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Service;
using Model;


namespace VoteMiss
{
    public partial class FormCreateAcc : Form
    {
        private IUserService service = new UserService();
        public FormCreateAcc()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtUserName.Text.Trim()) && !string.IsNullOrEmpty(txtPass.Text.Trim()) && txtPass.TextLength > 6)
                {

                    User user = new User { UserName = txtUserName.Text, Role = "User", Pass = txtPass.Text };
                    service.addUser(user);
                    FormAdmin form = new FormAdmin();
                    form.Show();
                    this.Close();

                }
                else
                {
                    MessageBox.Show("UserName or pass are not null and pass  >6 character");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Invalid Input");
            }


        }
    }
}
