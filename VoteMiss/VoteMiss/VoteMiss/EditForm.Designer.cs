namespace VoteMiss
{
    partial class EditForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.txtName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtSize1 = new System.Windows.Forms.TextBox();
            this.txtSize2 = new System.Windows.Forms.TextBox();
            this.txtSize3 = new System.Windows.Forms.TextBox();
            this.txtAdreess = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnEdit = new System.Windows.Forms.Button();
            this.lblMissID = new System.Windows.Forms.Label();
            this.lblID = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(75, 73);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Name:";
            // 
            // txtName
            // 
            this.txtName.Location = new System.Drawing.Point(149, 67);
            this.txtName.Name = "txtName";
            this.txtName.Size = new System.Drawing.Size(145, 22);
            this.txtName.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(75, 126);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(51, 17);
            this.label2.TabIndex = 2;
            this.label2.Text = "Size 1:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(75, 170);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 17);
            this.label3.TabIndex = 3;
            this.label3.Text = "Size 2:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(78, 224);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(51, 17);
            this.label4.TabIndex = 4;
            this.label4.Text = "Size 3:";
            // 
            // txtSize1
            // 
            this.txtSize1.Location = new System.Drawing.Point(149, 126);
            this.txtSize1.Name = "txtSize1";
            this.txtSize1.Size = new System.Drawing.Size(145, 22);
            this.txtSize1.TabIndex = 5;
            // 
            // txtSize2
            // 
            this.txtSize2.Location = new System.Drawing.Point(149, 170);
            this.txtSize2.Name = "txtSize2";
            this.txtSize2.Size = new System.Drawing.Size(145, 22);
            this.txtSize2.TabIndex = 6;
            // 
            // txtSize3
            // 
            this.txtSize3.Location = new System.Drawing.Point(149, 218);
            this.txtSize3.Name = "txtSize3";
            this.txtSize3.Size = new System.Drawing.Size(145, 22);
            this.txtSize3.TabIndex = 7;
            // 
            // txtAdreess
            // 
            this.txtAdreess.Location = new System.Drawing.Point(149, 284);
            this.txtAdreess.Name = "txtAdreess";
            this.txtAdreess.Size = new System.Drawing.Size(145, 22);
            this.txtAdreess.TabIndex = 8;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(81, 288);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(52, 17);
            this.label5.TabIndex = 9;
            this.label5.Text = "Adress";
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(149, 351);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(75, 23);
            this.btnEdit.TabIndex = 10;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // lblMissID
            // 
            this.lblMissID.AutoSize = true;
            this.lblMissID.Location = new System.Drawing.Point(78, 22);
            this.lblMissID.Name = "lblMissID";
            this.lblMissID.Size = new System.Drawing.Size(0, 17);
            this.lblMissID.TabIndex = 11;
            this.lblMissID.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lblID
            // 
            this.lblID.AutoSize = true;
            this.lblID.Location = new System.Drawing.Point(78, 22);
            this.lblID.Name = "lblID";
            this.lblID.Size = new System.Drawing.Size(46, 17);
            this.lblID.TabIndex = 12;
            this.lblID.Text = "label6";
            // 
            // EditForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(500, 448);
            this.Controls.Add(this.lblID);
            this.Controls.Add(this.lblMissID);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtAdreess);
            this.Controls.Add(this.txtSize3);
            this.Controls.Add(this.txtSize2);
            this.Controls.Add(this.txtSize1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtName);
            this.Controls.Add(this.label1);
            this.Name = "EditForm";
            this.Text = "EditForm";
            this.Load += new System.EventHandler(this.EditForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtSize1;
        private System.Windows.Forms.TextBox txtSize2;
        private System.Windows.Forms.TextBox txtSize3;
        private System.Windows.Forms.TextBox txtAdreess;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Label lblMissID;
        public System.Windows.Forms.Label lblID;
    }
}