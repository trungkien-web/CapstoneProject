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
    public partial class Form1 : Form
    {

        private IMissService service = new MissService();
        public Form1()
        {
            InitializeComponent();

            var allmiss = service.GetAllMisses();

            listMiss.DataSource = allmiss;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            EditForm form = new EditForm();
            var selectedRow = listMiss.SelectedRows.Count > 0 ? listMiss.SelectedRows[0] : null;
            form.lblID.Text = selectedRow?.Cells["MissId"].Value.ToString();
            form.Show();
            this.Hide();
        }

    
        private void btnAdd_Click(object sender, EventArgs e)
        {
            AddForm form = new AddForm();
            form.Show();
            this.Hide();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Do you want to delete?", "", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {

                var selectedRow = listMiss.SelectedRows.Count > 0 ? listMiss.SelectedRows[0] : null;
                string ID = selectedRow?.Cells["MissId"].Value.ToString();
                service.Delete(int.Parse(ID));
                this.Hide();
                Form1 form = new Form1();
                form.Show();
            }
            else
            {
                this.Show();
            }

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            login.Show();
            this.Close();
        }
    }
}
