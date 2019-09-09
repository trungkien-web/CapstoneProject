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
    public partial class EditForm : Form
    {
        private IMissService service = new MissService();
        public EditForm()
        {
            InitializeComponent();
        }
        public void loadValue()
        {
            var missed = !string.IsNullOrEmpty(lblMissID.Text) ? service.GetByID(int.Parse(lblMissID.Text)) : null;
            this.txtName.Text = missed?.MissName;
            this.txtSize1.Text = missed?.size1.ToString();
            this.txtSize2.Text = missed?.size2.ToString();
            this.txtSize3.Text = missed?.size3.ToString();
            this.txtAdreess.Text = missed?.Adress;


        }
        private void checkInput()
        {
            
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {


            try
            {
                if (!string.IsNullOrEmpty(txtName.Text.Trim()) || !string.IsNullOrEmpty(txtSize1.Text.Trim()) ||
                   !string.IsNullOrEmpty(txtSize2.Text.Trim()) || !string.IsNullOrEmpty(txtSize3.Text.Trim()))
                {
                    service.UpdateMiss(new Miss
                    {

                        MissId = int.Parse(lblID.Text),
                        MissName = txtName.Text,
                        size1 = int.Parse(txtSize1.Text),
                        size2 = int.Parse(txtSize2.Text),
                        size3 = int.Parse(txtSize3.Text),
                        Adress = txtAdreess.Text
                    });
                    FormAdmin form = new FormAdmin();
                    form.Show();
                    this.Hide();
                    this.Close();
                   
                }else
                {
                    MessageBox.Show("Invalid Input");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Invalid input");
          
            }


         
        }

        private void EditForm_Load(object sender, EventArgs e)
        {
            loadValue();
        }
    }
}
