namespace VoteMiss
{
    partial class FormUser
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.missBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.lblUser = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.missIdDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.missNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.birthOfDateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.size1DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.size2DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.size3DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.adressDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.missBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.missIdDataGridViewTextBoxColumn,
            this.missNameDataGridViewTextBoxColumn,
            this.birthOfDateDataGridViewTextBoxColumn,
            this.size1DataGridViewTextBoxColumn,
            this.size2DataGridViewTextBoxColumn,
            this.size3DataGridViewTextBoxColumn,
            this.adressDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.missBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(31, 73);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(910, 194);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // missBindingSource
            // 
            this.missBindingSource.DataSource = typeof(Model.Miss);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(71, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(121, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Login User By As:";
            // 
            // lblUser
            // 
            this.lblUser.AutoSize = true;
            this.lblUser.Location = new System.Drawing.Point(199, 29);
            this.lblUser.Name = "lblUser";
            this.lblUser.Size = new System.Drawing.Size(46, 17);
            this.lblUser.TabIndex = 2;
            this.lblUser.Text = "label2";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(283, 21);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 32);
            this.button1.TabIndex = 3;
            this.button1.Text = "Log Out";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
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
            // FormUser
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1002, 354);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.lblUser);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "FormUser";
            this.Text = "FormUser";
            this.Load += new System.EventHandler(this.FormUser_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.missBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn votesDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource missBindingSource;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblUser;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.DataGridViewTextBoxColumn missIdDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn missNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn birthOfDateDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn size1DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn size2DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn size3DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn adressDataGridViewTextBoxColumn;
    }
}