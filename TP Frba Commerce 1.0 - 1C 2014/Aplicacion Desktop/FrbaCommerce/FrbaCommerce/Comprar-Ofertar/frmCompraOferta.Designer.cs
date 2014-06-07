namespace FrbaCommerce.Comprar_Ofertar
{
    partial class frmCompraOferta
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
            this.lblCantidadMonto = new System.Windows.Forms.Label();
            this.numCantidadMonto = new System.Windows.Forms.NumericUpDown();
            this.txtPublicacion = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnPreguntar = new System.Windows.Forms.Button();
            this.btnComprarOfertar = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numCantidadMonto)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtPublicacion_Id);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.lblCantidadMonto);
            this.groupBox1.Controls.Add(this.numCantidadMonto);
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
            // lblCantidadMonto
            // 
            this.lblCantidadMonto.AutoSize = true;
            this.lblCantidadMonto.Location = new System.Drawing.Point(47, 73);
            this.lblCantidadMonto.Name = "lblCantidadMonto";
            this.lblCantidadMonto.Size = new System.Drawing.Size(79, 13);
            this.lblCantidadMonto.TabIndex = 9;
            this.lblCantidadMonto.Text = "CantidadMonto";
            this.lblCantidadMonto.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // numCantidadMonto
            // 
            this.numCantidadMonto.Location = new System.Drawing.Point(132, 71);
            this.numCantidadMonto.Name = "numCantidadMonto";
            this.numCantidadMonto.Size = new System.Drawing.Size(120, 20);
            this.numCantidadMonto.TabIndex = 8;
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
            // btnPreguntar
            // 
            this.btnPreguntar.Location = new System.Drawing.Point(79, 128);
            this.btnPreguntar.Name = "btnPreguntar";
            this.btnPreguntar.Size = new System.Drawing.Size(75, 23);
            this.btnPreguntar.TabIndex = 8;
            this.btnPreguntar.Text = "Preguntar";
            this.btnPreguntar.UseVisualStyleBackColor = true;
            this.btnPreguntar.Click += new System.EventHandler(this.Preguntar_Click);
            // 
            // btnComprarOfertar
            // 
            this.btnComprarOfertar.Location = new System.Drawing.Point(403, 127);
            this.btnComprarOfertar.Name = "btnComprarOfertar";
            this.btnComprarOfertar.Size = new System.Drawing.Size(75, 23);
            this.btnComprarOfertar.TabIndex = 7;
            this.btnComprarOfertar.Text = "CompOfer";
            this.btnComprarOfertar.UseVisualStyleBackColor = true;
            this.btnComprarOfertar.Click += new System.EventHandler(this.btnComprarOfertar_Click);
            // 
            // frmCompraOferta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(519, 173);
            this.Controls.Add(this.btnPreguntar);
            this.Controls.Add(this.btnComprarOfertar);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmCompraOferta";
            this.Text = "frmCompraOferta";
            this.Load += new System.EventHandler(this.frmCompraOferta_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numCantidadMonto)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtPublicacion_Id;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblCantidadMonto;
        private System.Windows.Forms.NumericUpDown numCantidadMonto;
        private System.Windows.Forms.TextBox txtPublicacion;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnPreguntar;
        private System.Windows.Forms.Button btnComprarOfertar;
    }
}