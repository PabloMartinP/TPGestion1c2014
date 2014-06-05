namespace FrbaCommerce.Editar_Publicacion
{
    partial class frmEditarPublicacion
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
            this.btnGuardar = new System.Windows.Forms.Button();
            this.ucPublicacion1 = new FrbaCommerce.Controles.ucPublicacion();
            this.SuspendLayout();
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(232, 308);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(106, 23);
            this.btnGuardar.TabIndex = 1;
            this.btnGuardar.Text = "Guardar Cambios";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // ucPublicacion1
            // 
            this.ucPublicacion1.Location = new System.Drawing.Point(22, 12);
            this.ucPublicacion1.Name = "ucPublicacion1";
            this.ucPublicacion1.Size = new System.Drawing.Size(546, 290);
            this.ucPublicacion1.TabIndex = 0;
            // 
            // frmEditarPublicacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(594, 341);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.ucPublicacion1);
            this.Name = "frmEditarPublicacion";
            this.Text = "frmEditarPublicacion";
            this.Load += new System.EventHandler(this.frmEditarPublicacion_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private FrbaCommerce.Controles.ucPublicacion ucPublicacion1;
        private System.Windows.Forms.Button btnGuardar;
    }
}