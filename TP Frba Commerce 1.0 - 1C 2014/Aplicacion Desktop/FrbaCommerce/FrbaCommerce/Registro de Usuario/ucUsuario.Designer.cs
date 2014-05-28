namespace FrbaCommerce.RegistrarUsuario
{
    partial class ucUsuario
    {
        /// <summary> 
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de componentes

        /// <summary> 
        /// Método necesario para admitir el Diseñador. No se puede modificar 
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblUserName = new System.Windows.Forms.Label();
            this.txtUserName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtRePassword = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtRol = new System.Windows.Forms.TextBox();
            this.gbUsuario = new System.Windows.Forms.GroupBox();
            this.gbUsuario.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblUserName
            // 
            this.lblUserName.AutoSize = true;
            this.lblUserName.Location = new System.Drawing.Point(15, 27);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(57, 13);
            this.lblUserName.TabIndex = 0;
            this.lblUserName.Text = "UserName";
            // 
            // txtUserName
            // 
            this.txtUserName.Location = new System.Drawing.Point(97, 24);
            this.txtUserName.Name = "txtUserName";
            this.txtUserName.Size = new System.Drawing.Size(141, 20);
            this.txtUserName.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 52);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Password";
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(97, 49);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(141, 20);
            this.txtPassword.TabIndex = 3;
            // 
            // txtRePassword
            // 
            this.txtRePassword.Location = new System.Drawing.Point(97, 75);
            this.txtRePassword.Name = "txtRePassword";
            this.txtRePassword.Size = new System.Drawing.Size(141, 20);
            this.txtRePassword.TabIndex = 4;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(15, 78);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(70, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Re-Password";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(15, 104);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(70, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Rol Asignado";
            // 
            // txtRol
            // 
            this.txtRol.Location = new System.Drawing.Point(97, 101);
            this.txtRol.Name = "txtRol";
            this.txtRol.ReadOnly = true;
            this.txtRol.Size = new System.Drawing.Size(141, 20);
            this.txtRol.TabIndex = 8;
            // 
            // gbUsuario
            // 
            this.gbUsuario.Controls.Add(this.txtUserName);
            this.gbUsuario.Controls.Add(this.txtRol);
            this.gbUsuario.Controls.Add(this.lblUserName);
            this.gbUsuario.Controls.Add(this.label4);
            this.gbUsuario.Controls.Add(this.label2);
            this.gbUsuario.Controls.Add(this.label3);
            this.gbUsuario.Controls.Add(this.txtPassword);
            this.gbUsuario.Controls.Add(this.txtRePassword);
            this.gbUsuario.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gbUsuario.Location = new System.Drawing.Point(0, 0);
            this.gbUsuario.Name = "gbUsuario";
            this.gbUsuario.Size = new System.Drawing.Size(256, 140);
            this.gbUsuario.TabIndex = 9;
            this.gbUsuario.TabStop = false;
            this.gbUsuario.Text = "Usuario";
            // 
            // ucUsuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.gbUsuario);
            this.Name = "ucUsuario";
            this.Size = new System.Drawing.Size(256, 140);
            this.gbUsuario.ResumeLayout(false);
            this.gbUsuario.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.TextBox txtUserName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtRePassword;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtRol;
        private System.Windows.Forms.GroupBox gbUsuario;
    }
}
