namespace FrbaCommerce.Registro_de_Usuario
{
    partial class frmNuevoUsuarioEmpresa
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
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnAceptar = new System.Windows.Forms.Button();
            this.ucEmpresa1 = new FrbaCommerce.Controles.ucEmpresa();
            this.ucUsuario1 = new FrbaCommerce.RegistrarUsuario.ucUsuario();
            this.SuspendLayout();
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(226, 537);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.TabIndex = 5;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // btnAceptar
            // 
            this.btnAceptar.Location = new System.Drawing.Point(29, 537);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(75, 23);
            this.btnAceptar.TabIndex = 4;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = true;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
            // 
            // ucEmpresa1
            // 
            this.ucEmpresa1.Location = new System.Drawing.Point(12, 158);
            this.ucEmpresa1.Name = "ucEmpresa1";
            this.ucEmpresa1.Size = new System.Drawing.Size(292, 373);
            this.ucEmpresa1.TabIndex = 1;
            // 
            // ucUsuario1
            // 
            this.ucUsuario1.Location = new System.Drawing.Point(12, 12);
            this.ucUsuario1.Name = "ucUsuario1";
            this.ucUsuario1.Size = new System.Drawing.Size(292, 140);
            this.ucUsuario1.TabIndex = 0;
            this.ucUsuario1.Tipo = FrbaCommerce.Entity.Usuario.eTipo.Empresa;
            // 
            // frmNuevoUsuarioEmpresa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(313, 570);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.ucEmpresa1);
            this.Controls.Add(this.ucUsuario1);
            this.Name = "frmNuevoUsuarioEmpresa";
            this.Text = "frmNuevoUsuarioEmpresa";
            this.ResumeLayout(false);

        }

        #endregion

        private FrbaCommerce.RegistrarUsuario.ucUsuario ucUsuario1;
        private FrbaCommerce.Controles.ucEmpresa ucEmpresa1;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnAceptar;
    }
}