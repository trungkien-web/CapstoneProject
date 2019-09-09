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
    public partial class FormVote : Form
    {
        private IMissService service = new MissService();
        private IVoteService serviceVote = new VoteService();
        private ICommentService serviceComment = new CommentService();
        MissVoteEntities ctx;

        public FormVote()
        {

            InitializeComponent();
        }
        public void loadValue()
        {
            var missed = !string.IsNullOrEmpty(lblMissID.Text) ? service.GetByID(int.Parse(lblMissID.Text)) : null;
            this.txtMissName.Text = missed?.MissName;
            pictureBox.Image = new Bitmap (Application.StartupPath+ "\\Resoures\\" +missed?.Image);
            this.txtBirthDate.Text = missed?.BirthOfDate.Value.ToShortDateString();
            this.txtSize1.Text = missed?.size1.ToString();
            this.txtSize2.Text = missed?.size2.ToString();
            this.txtSize3.Text = missed?.size3.ToString();
            this.txtAddress.Text = missed?.Adress;
            this.txtVote.Text = serviceVote.countVote(int.Parse(lblMissID.Text)).ToString();
            this.lblCountComment.Text = serviceComment.countComment(int.Parse(lblMissID.Text)).ToString();


            var comment = serviceComment.GetAllComment();
            foreach (var item in comment)
            {
                if (item.MissId == int.Parse(lblMissID.Text))
                {
                    txtComment.AppendText(item.User.UserName + " : " + item.Content + "\n");
                }
            }

            CheckVote();

        }

        private void FormVote_Load(object sender, EventArgs e)
        {
            loadValue();
        }
        public void CheckVote()
        {
           
            List<Vote> listVote = serviceVote.getAllVote();
            foreach (Vote item in listVote)
            {
                if (item.UserId==LoggedUser.UserID && item.MissId==int.Parse(lblMissID.Text))
                {
                 
                        btnVote.Enabled = false;
                    
                }
            }
        }

        private void btnVote_Click(object sender, EventArgs e)
        {
            Vote vote = new Vote { UserId = LoggedUser.UserID , MissId = int.Parse(lblMissID.Text) };
            serviceVote.addVote(vote);
            this.txtVote.Text = serviceVote.countVote(int.Parse(lblMissID.Text)).ToString();
            btnVote.Enabled = false;

        }

        private void btnComment_Click(object sender, EventArgs e)
        {
            Comment comment = new Comment { UserId = LoggedUser.UserID, MissId = int.Parse(lblMissID.Text) , Content = textBox1.Text};
            serviceComment.AddComment(comment);
            this.lblCountComment.Text = serviceComment.countComment(int.Parse(lblMissID.Text)).ToString();
            txtComment.AppendText(LoggedUser.Username + " : "+textBox1.Text+"\n");
            textBox1.Text = "";

        }
    }
}
