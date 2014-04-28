namespace FrbaCommerce.AbmRol
{
    partial class frmRol_SeleccionEliminar
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
            this.btnEliminar = new System.Windows.Forms.Button();
            this.ucRol_Listado1 = new FrbaCommerce.AbmRol.ucRol_Listado();
            this.SuspendLayout();
            // 
            // btnEliminar
            // 
            this.btnEliminar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEliminar.Location = new System.Drawing.Point(155, 218);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(75, 23);
            this.btnEliminar.TabIndex = 1;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            this.btnEliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // ucRol_Listado1
            // 
            this.ucRol_Listado1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.ucRol_Listado1.Location = new System.Drawing.Point(5, 5);
            this.ucRol_Listado1.Name = "ucRol_Listado1";
            this.ucRol_Listado1.Size = new System.Drawing.Size(225, 207);
            this.ucRol_Listado1.TabIndex = 0;
            // 
            // frmRol_SeleccionEliminar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(242, 253);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.ucRol_Listado1);
            this.Name = "frmRol_SeleccionEliminar";
            this.Text = "Eliminar rol";
            this.ResumeLayout(false);

        }

        #endregion

        private ucRol_Listado ucRol_Listado1;
        private System.Windows.Forms.Button btnEliminar;
    }
}