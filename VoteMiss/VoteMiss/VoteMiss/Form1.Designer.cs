namespace VoteMiss
{
    partial class Form1
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
            this.components = new System.ComponentModel.Container();
            this.listMiss = new System.Windows.Forms.DataGridView();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnLogin = new System.Windows.Forms.Button();
            this.missBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.missIdDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.missNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.imageDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.birthOfDateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.size1DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.size2DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.size3DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.adressDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.commentsDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.votesDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.listMiss)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.missBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // listMiss
            // 
            this.listMiss.AutoGenerateColumns = false;
            this.listMiss.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.listMiss.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.missIdDataGridViewTextBoxColumn,
            this.missNameDataGridViewTextBoxColumn,
            this.imageDataGridViewTextBoxColumn,
            this.birthOfDateDataGridViewTextBoxColumn,
            this.size1DataGridViewTextBoxColumn,
            this.size2DataGridViewTextBoxColumn,
            this.size3DataGridViewTextBoxColumn,
            this.adressDataGridViewTextBoxColumn,
            this.commentsDataGridViewTextBoxColumn,
            this.votesDataGridViewTextBoxColumn});
            this.listMiss.DataSource = this.missBindingSource;
            this.listMiss.Location = new System.Drawing.Point(40, 24);
            this.listMiss.Name = "listMiss";
            this.listMiss.RowTemplate.Height = 24;
            this.listMiss.Size = new System.Drawing.Size(794, 214);
            this.listMiss.TabIndex = 0;
            this.listMiss.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(106, 304);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.TabIndex = 1;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(291, 304);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.TabIndex = 2;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(499, 304);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(75, 23);
            this.btnEdit.TabIndex = 3;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnLogin
            // 
            this.btnLogin.Location = new System.Drawing.Point(675, 304);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(75, 23);
            this.btnLogin.TabIndex = 4;
            this.btnLogin.Text = "LogOut";
            this.btnLogin.UseVisualStyleBackColor = true;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // missBindingSource
            // 
            this.missBindingSource.DataSource = typeof(Model.Miss);
            // 
            // missIdDataGridViewTextBoxColumn
            // 
            this.missIdDataGridViewTextBoxColumn.DataPropertyName = "MissId";
            this.missIdDataGridViewTextBoxColumn.HeaderText = "MissId";
            this.missIdDataGridViewTextBoxColumn.Name = "missIdDataGridViewTextBoxColumn";
            // 
            // missNameDataGridViewTextBoxColumn
            // 
            this.missNameDataGridViewTextBoxColumn.DataPropertyName = "MissName";
            this.missNameDataGridViewTextBoxColumn.HeaderText = "MissName";
            this.missNameDataGridViewTextBoxColumn.Name = "missNameDataGridViewTextBoxColumn";
            // 
            // imageDataGridViewTextBoxColumn
            // 
            this.imageDataGridViewTextBoxColumn.DataPropertyName = "Image";
            this.imageDataGridViewTextBoxColumn.HeaderText = "Image";
            this.imageDataGridViewTextBoxColumn.Name = "imageDataGridViewTextBoxColumn";
            // 
            // birthOfDateDataGridViewTextBoxColumn
            // 
            this.birthOfDateDataGridViewTextBoxColumn.DataPropertyName = "BirthOfDate";
            this.birthOfDateDataGridViewTextBoxColumn.HeaderText = "BirthOfDate";
            this.birthOfDateDataGridViewTextBoxColumn.Name = "birthOfDateDataGridViewTextBoxColumn";
            // 
            // size1DataGridViewTextBoxColumn
            // 
            this.size1DataGridViewTextBoxColumn.DataPropertyName = "size1";
            this.size1DataGridViewTextBoxColumn.HeaderText = "size1";
            this.size1DataGridViewTextBoxColumn.Name = "size1DataGridViewTextBoxColumn";
            // 
            // size2DataGridViewTextBoxColumn
            // 
            this.size2DataGridViewTextBoxColumn.DataPropertyName = "size2";
            this.size2DataGridViewTextBoxColumn.HeaderText = "size2";
            this.size2DataGridViewTextBoxColumn.Name = "size2DataGridViewTextBoxColumn";
            // 
            // size3DataGridViewTextBoxColumn
            // 
            this.size3DataGridViewTextBoxColumn.DataPropertyName = "size3";
            this.size3DataGridViewTextBoxColumn.HeaderText = "size3";
            this.size3DataGridViewTextBoxColumn.Name = "size3DataGridViewTextBoxColumn";
            // 
            // adressDataGridViewTextBoxColumn
            // 
            this.adressDataGridViewTextBoxColumn.DataPropertyName = "Adress";
            this.adressDataGridViewTextBoxColumn.HeaderText = "Adress";
            this.adressDataGridViewTextBoxColumn.Name = "adressDataGridViewTextBoxColumn";
            // 
            // commentsDataGridViewTextBoxColumn
            // 
            this.commentsDataGridViewTextBoxColumn.DataPropertyName = "Comments";
            this.commentsDataGridViewTextBoxColumn.HeaderText = "Comments";
            this.commentsDataGridViewTextBoxColumn.Name = "commentsDataGridViewTextBoxColumn";
            // 
            // votesDataGridViewTextBoxColumn
            // 
            this.votesDataGridViewTextBoxColumn.DataPropertyName = "Votes";
            this.votesDataGridViewTextBoxColumn.HeaderText = "Votes";
            this.votesDataGridViewTextBoxColumn.Name = "votesDataGridViewTextBoxColumn";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(884, 430);
            this.Controls.Add(this.btnLogin);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.listMiss);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.listMiss)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.missBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView listMiss;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnLogin;
        private System.Windows.Forms.DataGridViewTextBoxColumn missIdDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn missNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn imageDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn birthOfDateDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn size1DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn size2DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn size3DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn adressDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn commentsDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn votesDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource missBindingSource;
    }
}

