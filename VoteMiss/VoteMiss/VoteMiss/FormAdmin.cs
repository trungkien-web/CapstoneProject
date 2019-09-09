

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
    public partial class FormAdmin : Form
    {
        private IMissService service = new MissService();
        public FormAdmin()
        {
            InitializeComponent();
            lblAdmin.Text = LoggedUser.Username;
            var allmiss = service.GetAllMisses();
            listMiss.DataSource = allmiss;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            AddForm form = new AddForm();
            form.Show();
            this.Hide();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            EditForm form = new EditForm();
            var selectedRow = listMiss.SelectedRows.Count > 0 ? listMiss.SelectedRows[0] : null;
            form.lblID.Text = selectedRow?.Cells[0].Value.ToString();
            form.Show();
            this.Hide();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Do you want to delete?", "", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {

                var selectedRow = listMiss.SelectedRows.Count > 0 ? listMiss.SelectedRows[0] : null;
                string ID = selectedRow?.Cells[0].Value.ToString();
                service.Delete(int.Parse(ID));
                this.Hide();
                FormAdmin form = new FormAdmin();
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

        private void lblAdmin_Click(object sender, EventArgs e)
        {

        }

        private void listMiss_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            var selectedRow = listMiss.Rows[e.RowIndex];
            if (e.ColumnIndex == 1)
            {
                EditForm form = new EditForm();
                form.lblID.Text = selectedRow.Cells[0].Value.ToString();
                form.Owner = this;
                form.Show(this);
            }
        }

        private void FormAdmin_Load(object sender, EventArgs e)
        {

        }

        private void btnCreateAcc_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormCreateAcc create = new FormCreateAcc();
            create.Show();
        }
    }
}
