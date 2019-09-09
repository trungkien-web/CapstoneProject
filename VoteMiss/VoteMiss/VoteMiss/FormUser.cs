using Service;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Model;
namespace VoteMiss
{
    public partial class FormUser : Form
    {
        private IMissService service = new MissService();
        public FormUser()
        {
            InitializeComponent();
            lblUser.Text = LoggedUser.Username;
            var allmiss = service.GetAllMisses();
            dataGridView1.DataSource = allmiss;
            AddButtonToDataGridView("Vote", "Vote");
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.RowHeadersVisible = false;
            dataGridView1.ReadOnly = true;
            dataGridView1.AllowUserToAddRows = false;


        }
        public void AddButtonToDataGridView(String Name, String Text)
        {
            dataGridView1.Columns.Add(new DataGridViewButtonColumn { Name = Name, Text = Text, UseColumnTextForButtonValue = true });
        }
      

        private void FormUser_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            login.Show();
            this.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
            var selectedRow = dataGridView1.Rows[e.RowIndex];
            if (e.ColumnIndex==7) {
                FormVote form = new FormVote();
                form.lblMissID.Text = selectedRow.Cells[0].Value.ToString();
                form.Owner = this;
                form.Show(this);
            }
        }
    }
}
