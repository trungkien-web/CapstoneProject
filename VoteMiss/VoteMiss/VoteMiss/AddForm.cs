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
    public partial class AddForm : Form
    {
        private IMissService service = new MissService();
        public AddForm()
        {
            InitializeComponent();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtID.Text.Trim()) || !string.IsNullOrEmpty(txtName.Text.Trim()) || !string.IsNullOrEmpty(txtImage.Text.Trim()) ||
                        !string.IsNullOrEmpty(txtSize1.Text.Trim()) || !string.IsNullOrEmpty(txtSize2.Text.Trim()) || !string.IsNullOrEmpty(txtSize3.Text.Trim())
                        || !string.IsNullOrEmpty(txtAddress.Text.Trim())
                        )
                {
                    service.AddMiss(new Miss
                    {
                        MissId = int.Parse(txtID.Text),
                        MissName = txtName.Text,
                        Image = txtImage.Text,
                        BirthOfDate = DateTime.Parse(dateTime.Text),
                        size1 = int.Parse(txtSize1.Text),
                        size2 = int.Parse(txtSize2.Text),
                        size3 = int.Parse(txtSize3.Text),
                        Adress = txtAddress.Text
                    }

                );
                    FormAdmin form = new FormAdmin();
                    form.Show();
                    this.Hide();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Invaild input");
                }
            }catch (Exception)
            {
                MessageBox.Show("Invalid input");
            }
           

        }
    }
}
