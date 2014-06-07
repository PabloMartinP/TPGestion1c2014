namespace FrbaCommerce.Historial_Cliente
{
    partial class frmHistorialCliente
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.rbtnCompras = new System.Windows.Forms.RadioButton();
            this.rbtnOfertas = new System.Windows.Forms.RadioButton();
            this.rbtnCalificaciones = new System.Windows.Forms.RadioButton();
            this.btnVer = new System.Windows.Forms.Button();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnVer);
            this.groupBox1.Controls.Add(this.rbtnCalificaciones);
            this.groupBox1.Controls.Add(this.rbtnOfertas);
            this.groupBox1.Controls.Add(this.rbtnCompras);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(656, 61);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Informes";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dgv);
            this.groupBox2.Location = new System.Drawing.Point(12, 79);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(656, 286);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Resultado";
            // 
            // rbtnCompras
            // 
            this.rbtnCompras.AutoSize = true;
            this.rbtnCompras.Location = new System.Drawing.Point(45, 26);
            this.rbtnCompras.Name = "rbtnCompras";
            this.rbtnCompras.Size = new System.Drawing.Size(66, 17);
            this.rbtnCompras.TabIndex = 0;
            this.rbtnCompras.TabStop = true;
            this.rbtnCompras.Text = "Compras";
            this.rbtnCompras.UseVisualStyleBackColor = true;
            // 
            // rbtnOfertas
            // 
            this.rbtnOfertas.AutoSize = true;
            this.rbtnOfertas.Location = new System.Drawing.Point(177, 26);
            this.rbtnOfertas.Name = "rbtnOfertas";
            this.rbtnOfertas.Size = new System.Drawing.Size(59, 17);
            this.rbtnOfertas.TabIndex = 1;
            this.rbtnOfertas.TabStop = true;
            this.rbtnOfertas.Text = "Ofertas";
            this.rbtnOfertas.UseVisualStyleBackColor = true;
            // 
            // rbtnCalificaciones
            // 
            this.rbtnCalificaciones.AutoSize = true;
            this.rbtnCalificaciones.Location = new System.Drawing.Point(311, 26);
            this.rbtnCalificaciones.Name = "rbtnCalificaciones";
            this.rbtnCalificaciones.Size = new System.Drawing.Size(90, 17);
            this.rbtnCalificaciones.TabIndex = 2;
            this.rbtnCalificaciones.TabStop = true;
            this.rbtnCalificaciones.Text = "Calificaciones";
            this.rbtnCalificaciones.UseVisualStyleBackColor = true;
            // 
            // btnVer
            // 
            this.btnVer.Location = new System.Drawing.Point(504, 23);
            this.btnVer.Name = "btnVer";
            this.btnVer.Size = new System.Drawing.Size(75, 23);
            this.btnVer.TabIndex = 2;
            this.btnVer.Text = "Ver";
            this.btnVer.UseVisualStyleBackColor = true;
            this.btnVer.Click += new System.EventHandler(this.btnVer_Click);
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgv.Location = new System.Drawing.Point(3, 16);
            this.dgv.Name = "dgv";
            this.dgv.ReadOnly = true;
            this.dgv.Size = new System.Drawing.Size(650, 267);
            this.dgv.TabIndex = 0;
            // 
            // frmHistorialCliente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(680, 377);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmHistorialCliente";
            this.Text = "frmHistorialCliente";
            this.Load += new System.EventHandler(this.frmHistorialCliente_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnVer;
        private System.Windows.Forms.RadioButton rbtnCalificaciones;
        private System.Windows.Forms.RadioButton rbtnOfertas;
        private System.Windows.Forms.RadioButton rbtnCompras;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.DataGridView dgv;
    }
}