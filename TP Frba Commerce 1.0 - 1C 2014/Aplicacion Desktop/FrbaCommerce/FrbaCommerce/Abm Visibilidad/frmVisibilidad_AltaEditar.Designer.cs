namespace FrbaCommerce.Abm_Visibilidad
{
    partial class frmVisibilidad_AltaEditar
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
            this.ucVisibilidad1 = new FrbaCommerce.Abm_Visibilidad.ucVisibilidad();
            this.btnAgregarEditar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ucVisibilidad1
            // 
            this.ucVisibilidad1.Location = new System.Drawing.Point(12, 12);
            this.ucVisibilidad1.Name = "ucVisibilidad1";
            this.ucVisibilidad1.Size = new System.Drawing.Size(242, 207);
            this.ucVisibilidad1.TabIndex = 0;
            // 
            // btnAgregarEditar
            // 
            this.btnAgregarEditar.Location = new System.Drawing.Point(105, 225);
            this.btnAgregarEditar.Name = "btnAgregarEditar";
            this.btnAgregarEditar.Size = new System.Drawing.Size(75, 23);
            this.btnAgregarEditar.TabIndex = 1;
            this.btnAgregarEditar.Text = "AddEdit";
            this.btnAgregarEditar.UseVisualStyleBackColor = true;
            this.btnAgregarEditar.Click += new System.EventHandler(this.btnAgregarEditar_Click);
            // 
            // frmVisibilidad_AltaEditar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(275, 259);
            this.Controls.Add(this.btnAgregarEditar);
            this.Controls.Add(this.ucVisibilidad1);
            this.Name = "frmVisibilidad_AltaEditar";
            this.Text = "frmVisibilidad_AltaEditar";
            this.Load += new System.EventHandler(this.frmVisibilidad_AltaEditar_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private ucVisibilidad ucVisibilidad1;
        private System.Windows.Forms.Button btnAgregarEditar;
    }
}