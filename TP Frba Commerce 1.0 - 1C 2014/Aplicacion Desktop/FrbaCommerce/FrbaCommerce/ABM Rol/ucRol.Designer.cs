namespace FrbaCommerce.AbmRol
{
    partial class ucRol
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
            this.gbFuncionalidades = new System.Windows.Forms.GroupBox();
            this.flpFuncionalidades = new System.Windows.Forms.FlowLayoutPanel();
            this.lblRol = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.chkHabilitado = new System.Windows.Forms.CheckBox();
            this.gbFuncionalidades.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbFuncionalidades
            // 
            this.gbFuncionalidades.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.gbFuncionalidades.Controls.Add(this.flpFuncionalidades);
            this.gbFuncionalidades.Location = new System.Drawing.Point(5, 34);
            this.gbFuncionalidades.Name = "gbFuncionalidades";
            this.gbFuncionalidades.Size = new System.Drawing.Size(456, 270);
            this.gbFuncionalidades.TabIndex = 4;
            this.gbFuncionalidades.TabStop = false;
            this.gbFuncionalidades.Text = "Funcionalidades";
            // 
            // flpFuncionalidades
            // 
            this.flpFuncionalidades.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.flpFuncionalidades.Location = new System.Drawing.Point(3, 16);
            this.flpFuncionalidades.Name = "flpFuncionalidades";
            this.flpFuncionalidades.Size = new System.Drawing.Size(450, 251);
            this.flpFuncionalidades.TabIndex = 0;
            // 
            // lblRol
            // 
            this.lblRol.AutoSize = true;
            this.lblRol.Location = new System.Drawing.Point(25, 8);
            this.lblRol.Name = "lblRol";
            this.lblRol.Size = new System.Drawing.Size(44, 13);
            this.lblRol.TabIndex = 3;
            this.lblRol.Text = "Nombre";
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(73, 5);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(137, 20);
            this.txtNombre.TabIndex = 6;
            // 
            // chkHabilitado
            // 
            this.chkHabilitado.AutoSize = true;
            this.chkHabilitado.Checked = true;
            this.chkHabilitado.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkHabilitado.Location = new System.Drawing.Point(350, 8);
            this.chkHabilitado.Name = "chkHabilitado";
            this.chkHabilitado.Size = new System.Drawing.Size(73, 17);
            this.chkHabilitado.TabIndex = 7;
            this.chkHabilitado.Text = "Habilitado";
            this.chkHabilitado.UseVisualStyleBackColor = true;
            // 
            // ucRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.chkHabilitado);
            this.Controls.Add(this.txtNombre);
            this.Controls.Add(this.gbFuncionalidades);
            this.Controls.Add(this.lblRol);
            this.Name = "ucRol";
            this.Size = new System.Drawing.Size(465, 307);
            this.Load += new System.EventHandler(this.ucRol_Load);
            this.gbFuncionalidades.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox gbFuncionalidades;
        private System.Windows.Forms.FlowLayoutPanel flpFuncionalidades;
        private System.Windows.Forms.Label lblRol;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.CheckBox chkHabilitado;
    }
}
