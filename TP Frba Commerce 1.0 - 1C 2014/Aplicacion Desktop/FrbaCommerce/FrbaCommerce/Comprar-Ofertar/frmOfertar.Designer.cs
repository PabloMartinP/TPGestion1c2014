namespace FrbaCommerce.Comprar_Ofertar
{
    partial class frmOfertar
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
            this.txtPublicacion_Id = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.Cantidad = new System.Windows.Forms.Label();
            this.numOferta = new System.Windows.Forms.NumericUpDown();
            this.txtPublicacion = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnOfertar = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numOferta)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtPublicacion_Id);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.Cantidad);
            this.groupBox1.Controls.Add(this.numOferta);
            this.groupBox1.Controls.Add(this.txtPublicacion);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(495, 109);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Datos";
            // 
            // txtPublicacion_Id
            // 
            this.txtPublicacion_Id.Location = new System.Drawing.Point(132, 19);
            this.txtPublicacion_Id.Name = "txtPublicacion_Id";
            this.txtPublicacion_Id.ReadOnly = true;
            this.txtPublicacion_Id.Size = new System.Drawing.Size(100, 20);
            this.txtPublicacion_Id.TabIndex = 11;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(52, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 10;
            this.label1.Text = "Publicacion Id";
            // 
            // Cantidad
            // 
            this.Cantidad.AutoSize = true;
            this.Cantidad.Location = new System.Drawing.Point(89, 73);
            this.Cantidad.Name = "Cantidad";
            this.Cantidad.Size = new System.Drawing.Size(37, 13);
            this.Cantidad.TabIndex = 9;
            this.Cantidad.Text = "Monto";
            // 
            // numOferta
            // 
            this.numOferta.Location = new System.Drawing.Point(132, 71);
            this.numOferta.Name = "numOferta";
            this.numOferta.Size = new System.Drawing.Size(120, 20);
            this.numOferta.TabIndex = 8;
            // 
            // txtPublicacion
            // 
            this.txtPublicacion.Location = new System.Drawing.Point(132, 45);
            this.txtPublicacion.Name = "txtPublicacion";
            this.txtPublicacion.ReadOnly = true;
            this.txtPublicacion.Size = new System.Drawing.Size(334, 20);
            this.txtPublicacion.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(64, 48);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 13);
            this.label4.TabIndex = 6;
            this.label4.Text = "Publicacion";
            // 
            // btnOfertar
            // 
            this.btnOfertar.Location = new System.Drawing.Point(214, 127);
            this.btnOfertar.Name = "btnOfertar";
            this.btnOfertar.Size = new System.Drawing.Size(75, 23);
            this.btnOfertar.TabIndex = 4;
            this.btnOfertar.Text = "Ofertar";
            this.btnOfertar.UseVisualStyleBackColor = true;
            this.btnOfertar.Click += new System.EventHandler(this.btnOfertar_Click);
            // 
            // frmOfertar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(519, 157);
            this.Controls.Add(this.btnOfertar);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmOfertar";
            this.Text = "frmOfertar";
            this.Load += new System.EventHandler(this.frmOfertar_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numOferta)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtPublicacion_Id;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label Cantidad;
        private System.Windows.Forms.NumericUpDown numOferta;
        private System.Windows.Forms.TextBox txtPublicacion;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnOfertar;
    }
}