namespace FrbaCommerce.Login
{
    partial class frmLogin
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
            this.gbNuevoUsuario = new System.Windows.Forms.GroupBox();
            this.lnkTipoEmpresa = new System.Windows.Forms.LinkLabel();
            this.lnkTipoCliente = new System.Windows.Forms.LinkLabel();
            this.btnAceptar = new System.Windows.Forms.Button();
            this.gbDatos = new System.Windows.Forms.GroupBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtUserName = new System.Windows.Forms.TextBox();
            this.lblContraseña = new System.Windows.Forms.Label();
            this.lblNombreUsuario = new System.Windows.Forms.Label();
            this.gbNuevoUsuario.SuspendLayout();
            this.gbDatos.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbNuevoUsuario
            // 
            this.gbNuevoUsuario.Controls.Add(this.lnkTipoEmpresa);
            this.gbNuevoUsuario.Controls.Add(this.lnkTipoCliente);
            this.gbNuevoUsuario.Location = new System.Drawing.Point(12, 108);
            this.gbNuevoUsuario.Name = "gbNuevoUsuario";
            this.gbNuevoUsuario.Size = new System.Drawing.Size(205, 40);
            this.gbNuevoUsuario.TabIndex = 6;
            this.gbNuevoUsuario.TabStop = false;
            this.gbNuevoUsuario.Text = "Nuevo Usuario";
            // 
            // lnkTipoEmpresa
            // 
            this.lnkTipoEmpresa.AutoSize = true;
            this.lnkTipoEmpresa.Location = new System.Drawing.Point(110, 16);
            this.lnkTipoEmpresa.Name = "lnkTipoEmpresa";
            this.lnkTipoEmpresa.Size = new System.Drawing.Size(48, 13);
            this.lnkTipoEmpresa.TabIndex = 1;
            this.lnkTipoEmpresa.TabStop = true;
            this.lnkTipoEmpresa.Text = "Empresa";
            this.lnkTipoEmpresa.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lnkTipoEmpresa_LinkClicked);
            // 
            // lnkTipoCliente
            // 
            this.lnkTipoCliente.AutoSize = true;
            this.lnkTipoCliente.Location = new System.Drawing.Point(18, 16);
            this.lnkTipoCliente.Name = "lnkTipoCliente";
            this.lnkTipoCliente.Size = new System.Drawing.Size(39, 13);
            this.lnkTipoCliente.TabIndex = 0;
            this.lnkTipoCliente.TabStop = true;
            this.lnkTipoCliente.Text = "Cliente";
            this.lnkTipoCliente.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lnkTipoCliente_LinkClicked);
            // 
            // btnAceptar
            // 
            this.btnAceptar.Location = new System.Drawing.Point(223, 119);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(75, 23);
            this.btnAceptar.TabIndex = 5;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = true;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
            // 
            // gbDatos
            // 
            this.gbDatos.Controls.Add(this.txtPassword);
            this.gbDatos.Controls.Add(this.txtUserName);
            this.gbDatos.Controls.Add(this.lblContraseña);
            this.gbDatos.Controls.Add(this.lblNombreUsuario);
            this.gbDatos.Location = new System.Drawing.Point(12, 12);
            this.gbDatos.Name = "gbDatos";
            this.gbDatos.Size = new System.Drawing.Size(295, 90);
            this.gbDatos.TabIndex = 4;
            this.gbDatos.TabStop = false;
            this.gbDatos.Text = "Datos";
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(122, 53);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(155, 20);
            this.txtPassword.TabIndex = 3;
            // 
            // txtUserName
            // 
            this.txtUserName.Location = new System.Drawing.Point(122, 25);
            this.txtUserName.Name = "txtUserName";
            this.txtUserName.Size = new System.Drawing.Size(155, 20);
            this.txtUserName.TabIndex = 2;
            // 
            // lblContraseña
            // 
            this.lblContraseña.AutoSize = true;
            this.lblContraseña.Location = new System.Drawing.Point(18, 53);
            this.lblContraseña.Name = "lblContraseña";
            this.lblContraseña.Size = new System.Drawing.Size(61, 13);
            this.lblContraseña.TabIndex = 1;
            this.lblContraseña.Text = "Contraseña";
            // 
            // lblNombreUsuario
            // 
            this.lblNombreUsuario.AutoSize = true;
            this.lblNombreUsuario.Location = new System.Drawing.Point(18, 28);
            this.lblNombreUsuario.Name = "lblNombreUsuario";
            this.lblNombreUsuario.Size = new System.Drawing.Size(98, 13);
            this.lblNombreUsuario.TabIndex = 0;
            this.lblNombreUsuario.Text = "Nombre de Usuario";
            // 
            // frmLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(316, 157);
            this.Controls.Add(this.gbNuevoUsuario);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.gbDatos);
            this.Name = "frmLogin";
            this.Text = "frmLogin";
            this.gbNuevoUsuario.ResumeLayout(false);
            this.gbNuevoUsuario.PerformLayout();
            this.gbDatos.ResumeLayout(false);
            this.gbDatos.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbNuevoUsuario;
        private System.Windows.Forms.LinkLabel lnkTipoEmpresa;
        private System.Windows.Forms.LinkLabel lnkTipoCliente;
        private System.Windows.Forms.Button btnAceptar;
        private System.Windows.Forms.GroupBox gbDatos;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtUserName;
        private System.Windows.Forms.Label lblContraseña;
        private System.Windows.Forms.Label lblNombreUsuario;
    }
}