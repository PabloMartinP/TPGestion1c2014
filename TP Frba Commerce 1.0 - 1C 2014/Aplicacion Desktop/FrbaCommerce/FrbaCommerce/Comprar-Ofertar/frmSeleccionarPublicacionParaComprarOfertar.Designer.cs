namespace FrbaCommerce.Comprar_Ofertar
{
    partial class frmSeleccionarPublicacionParaComprarOfertar
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
            this.btnComprarOfertar = new System.Windows.Forms.Button();
            this.ucSeleccionarPublicacionCompraOferta1 = new FrbaCommerce.Controles.ucSeleccionarPublicacionCompraOferta();
            this.SuspendLayout();
            // 
            // btnComprarOfertar
            // 
            this.btnComprarOfertar.Location = new System.Drawing.Point(447, 521);
            this.btnComprarOfertar.Name = "btnComprarOfertar";
            this.btnComprarOfertar.Size = new System.Drawing.Size(92, 23);
            this.btnComprarOfertar.TabIndex = 3;
            this.btnComprarOfertar.Text = "Comprar/Ofertar";
            this.btnComprarOfertar.UseVisualStyleBackColor = true;
            this.btnComprarOfertar.Click += new System.EventHandler(this.btnComprarOfertar_Click);
            // 
            // ucSeleccionarPublicacionCompraOferta1
            // 
            this.ucSeleccionarPublicacionCompraOferta1.Location = new System.Drawing.Point(12, -1);
            this.ucSeleccionarPublicacionCompraOferta1.Name = "ucSeleccionarPublicacionCompraOferta1";
            this.ucSeleccionarPublicacionCompraOferta1.Size = new System.Drawing.Size(562, 516);
            this.ucSeleccionarPublicacionCompraOferta1.TabIndex = 0;
            // 
            // frmSeleccionarPublicacionParaComprarOfertar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(592, 553);
            this.Controls.Add(this.btnComprarOfertar);
            this.Controls.Add(this.ucSeleccionarPublicacionCompraOferta1);
            this.Name = "frmSeleccionarPublicacionParaComprarOfertar";
            this.Text = "frmSeleccionarPublicacionParaComprarOfertar";
            this.Load += new System.EventHandler(this.frmSeleccionarPublicacionParaComprarOfertar_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private FrbaCommerce.Controles.ucSeleccionarPublicacionCompraOferta ucSeleccionarPublicacionCompraOferta1;
        private System.Windows.Forms.Button btnComprarOfertar;
    }
}