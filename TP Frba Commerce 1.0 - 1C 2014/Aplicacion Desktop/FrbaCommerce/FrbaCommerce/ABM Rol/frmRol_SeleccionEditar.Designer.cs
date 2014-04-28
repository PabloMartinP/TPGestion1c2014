namespace FrbaCommerce.AbmRol
{
    partial class frmRol_SeleccionEditar
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
            this.btnEditar = new System.Windows.Forms.Button();
            this.ucRol_Listado1 = new FrbaCommerce.AbmRol.ucRol_Listado();
            this.SuspendLayout();
            // 
            // btnEditar
            // 
            this.btnEditar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEditar.Location = new System.Drawing.Point(154, 208);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(75, 23);
            this.btnEditar.TabIndex = 1;
            this.btnEditar.Text = "Editar";
            this.btnEditar.UseVisualStyleBackColor = true;
            this.btnEditar.Click += new System.EventHandler(this.btnEditar_Click);
            // 
            // ucRol_Listado1
            // 
            this.ucRol_Listado1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.ucRol_Listado1.Location = new System.Drawing.Point(1, 1);
            this.ucRol_Listado1.Name = "ucRol_Listado1";
            this.ucRol_Listado1.Size = new System.Drawing.Size(228, 201);
            this.ucRol_Listado1.TabIndex = 0;
            this.ucRol_Listado1.Load += new System.EventHandler(this.ucRol_Listado1_Load);
            // 
            // frmRol_SeleccionEditar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(236, 243);
            this.Controls.Add(this.btnEditar);
            this.Controls.Add(this.ucRol_Listado1);
            this.Name = "frmRol_SeleccionEditar";
            this.Text = "Seleccionar rol";
            this.Load += new System.EventHandler(this.frmRol_SeleccionEditar_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private ucRol_Listado ucRol_Listado1;
        private System.Windows.Forms.Button btnEditar;
    }
}