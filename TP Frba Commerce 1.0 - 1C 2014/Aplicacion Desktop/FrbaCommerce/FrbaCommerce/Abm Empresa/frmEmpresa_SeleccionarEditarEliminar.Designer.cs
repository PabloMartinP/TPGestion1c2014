namespace FrbaCommerce.Abm_Empresa
{
    partial class frmEmpresa_SeleccionarEditarEliminar
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
            this.ucEmpresa_Listado1 = new FrbaCommerce.Abm_Empresa.ucEmpresa_Listado();
            this.btnModificarEliminar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ucEmpresa_Listado1
            // 
            this.ucEmpresa_Listado1.Location = new System.Drawing.Point(18, 12);
            this.ucEmpresa_Listado1.Name = "ucEmpresa_Listado1";
            this.ucEmpresa_Listado1.Size = new System.Drawing.Size(546, 386);
            this.ucEmpresa_Listado1.TabIndex = 0;
            // 
            // btnModificarEliminar
            // 
            this.btnModificarEliminar.Location = new System.Drawing.Point(439, 404);
            this.btnModificarEliminar.Name = "btnModificarEliminar";
            this.btnModificarEliminar.Size = new System.Drawing.Size(75, 23);
            this.btnModificarEliminar.TabIndex = 1;
            this.btnModificarEliminar.Text = "EditDel";
            this.btnModificarEliminar.UseVisualStyleBackColor = true;
            this.btnModificarEliminar.Click += new System.EventHandler(this.btnModificarEliminar_Click);
            // 
            // frmEmpresa_SeleccionarEditarEliminar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 442);
            this.Controls.Add(this.btnModificarEliminar);
            this.Controls.Add(this.ucEmpresa_Listado1);
            this.Name = "frmEmpresa_SeleccionarEditarEliminar";
            this.Text = "frmEmpresa_SeleccionarEditarEliminar";
            this.ResumeLayout(false);

        }

        #endregion

        private ucEmpresa_Listado ucEmpresa_Listado1;
        private System.Windows.Forms.Button btnModificarEliminar;
    }
}