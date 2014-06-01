namespace FrbaCommerce.Abm_Cliente
{
    partial class frmCliente_SeleccionarEditar
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
            this.ucCliente_Listado1 = new FrbaCommerce.Abm_Cliente.ucCliente_Listado();
            this.SuspendLayout();
            // 
            // btnEditar
            // 
            this.btnEditar.Location = new System.Drawing.Point(438, 399);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(75, 23);
            this.btnEditar.TabIndex = 1;
            this.btnEditar.Text = "Editar";
            this.btnEditar.UseVisualStyleBackColor = true;
            this.btnEditar.Click += new System.EventHandler(this.btnEditar_Click);
            // 
            // ucCliente_Listado1
            // 
            this.ucCliente_Listado1.Location = new System.Drawing.Point(12, 12);
            this.ucCliente_Listado1.Name = "ucCliente_Listado1";
            this.ucCliente_Listado1.Size = new System.Drawing.Size(548, 381);
            this.ucCliente_Listado1.TabIndex = 0;
            // 
            // frmCliente_SeleccionarEditar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(572, 434);
            this.Controls.Add(this.btnEditar);
            this.Controls.Add(this.ucCliente_Listado1);
            this.Name = "frmCliente_SeleccionarEditar";
            this.Text = "frmCliente_SeleccionarEditar";
            this.Load += new System.EventHandler(this.frmCliente_SeleccionarEditar_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private ucCliente_Listado ucCliente_Listado1;
        private System.Windows.Forms.Button btnEditar;
    }
}