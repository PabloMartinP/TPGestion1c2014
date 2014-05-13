namespace FrbaCommerce.Registro_de_Usuario
{
    partial class frmNuevoUsuarioCliente
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
            this.btnAceptar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.ucCliente1 = new FrbaCommerce.Controles.ucCliente();
            this.ucUsuario1 = new FrbaCommerce.RegistrarUsuario.ucUsuario();
            this.SuspendLayout();
            // 
            // btnAceptar
            // 
            this.btnAceptar.Location = new System.Drawing.Point(33, 524);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(75, 23);
            this.btnAceptar.TabIndex = 2;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = true;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(270, 524);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.TabIndex = 3;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // ucCliente1
            // 
            this.ucCliente1.Location = new System.Drawing.Point(12, 158);
            this.ucCliente1.Name = "ucCliente1";
            this.ucCliente1.Size = new System.Drawing.Size(352, 360);
            this.ucCliente1.TabIndex = 1;
            // 
            // ucUsuario1
            // 
            this.ucUsuario1.Location = new System.Drawing.Point(12, 12);
            this.ucUsuario1.Name = "ucUsuario1";
            this.ucUsuario1.Size = new System.Drawing.Size(352, 140);
            this.ucUsuario1.TabIndex = 0;
            this.ucUsuario1.Tipo = FrbaCommerce.Entity.Usuario.eTipo.Cliente;
            // 
            // frmNuevoUsuarioCliente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(379, 555);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.ucCliente1);
            this.Controls.Add(this.ucUsuario1);
            this.Name = "frmNuevoUsuarioCliente";
            this.Text = "frmNuevoUsuarioCliente";
            this.Load += new System.EventHandler(this.frmNuevoUsuarioCliente_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private FrbaCommerce.RegistrarUsuario.ucUsuario ucUsuario1;
        private FrbaCommerce.Controles.ucCliente ucCliente1;
        private System.Windows.Forms.Button btnAceptar;
        private System.Windows.Forms.Button btnCancelar;
    }
}