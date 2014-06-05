
namespace FrbaCommerce.Generar_Publicacion
{
    partial class frmGenerarPublicacion
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
            this.ucPublicacion1 = new FrbaCommerce.Controles.ucPublicacion();
            this.btnGenerar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ucPublicacion1
            // 
            this.ucPublicacion1.Location = new System.Drawing.Point(22, 22);
            this.ucPublicacion1.Name = "ucPublicacion1";
            this.ucPublicacion1.Size = new System.Drawing.Size(542, 286);
            this.ucPublicacion1.TabIndex = 0;
            // 
            // btnGenerar
            // 
            this.btnGenerar.Location = new System.Drawing.Point(258, 314);
            this.btnGenerar.Name = "btnGenerar";
            this.btnGenerar.Size = new System.Drawing.Size(75, 23);
            this.btnGenerar.TabIndex = 1;
            this.btnGenerar.Text = "Generar";
            this.btnGenerar.UseVisualStyleBackColor = true;
            this.btnGenerar.Click += new System.EventHandler(this.btnGenerar_Click);
            // 
            // frmGenerarPublicacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(586, 344);
            this.Controls.Add(this.btnGenerar);
            this.Controls.Add(this.ucPublicacion1);
            this.Name = "frmGenerarPublicacion";
            this.Text = "frmGenerarPublicacion";
            this.Load += new System.EventHandler(this.frmGenerarPublicacion_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private FrbaCommerce.Controles.ucPublicacion ucPublicacion1;
        private System.Windows.Forms.Button btnGenerar;

    }
}