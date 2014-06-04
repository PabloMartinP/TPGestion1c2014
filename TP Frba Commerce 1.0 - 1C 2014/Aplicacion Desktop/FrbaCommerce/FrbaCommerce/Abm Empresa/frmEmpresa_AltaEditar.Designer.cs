namespace FrbaCommerce.Abm_Empresa
{
    partial class frmEmpresa_AltaEditar
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
            this.ucEmpresa1 = new FrbaCommerce.Controles.ucEmpresa();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ucEmpresa1
            // 
            this.ucEmpresa1.Location = new System.Drawing.Point(12, 12);
            this.ucEmpresa1.Name = "ucEmpresa1";
            this.ucEmpresa1.Size = new System.Drawing.Size(291, 382);
            this.ucEmpresa1.TabIndex = 0;
            // 
            // btnAgregar
            // 
            this.btnAgregar.Location = new System.Drawing.Point(120, 400);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(75, 23);
            this.btnAgregar.TabIndex = 1;
            this.btnAgregar.Text = "AddEdit";
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // frmEmpresa_AltaEditar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(324, 434);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.ucEmpresa1);
            this.Name = "frmEmpresa_AltaEditar";
            this.Text = "frmEmpresa_AltaEditar";
            this.Load += new System.EventHandler(this.frmEmpresa_AltaEditar_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private FrbaCommerce.Controles.ucEmpresa ucEmpresa1;
        private System.Windows.Forms.Button btnAgregar;
    }
}