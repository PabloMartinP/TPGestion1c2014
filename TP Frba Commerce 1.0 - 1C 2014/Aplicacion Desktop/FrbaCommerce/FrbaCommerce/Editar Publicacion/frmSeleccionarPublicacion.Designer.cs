namespace FrbaCommerce.Editar_Publicacion
{
    partial class frmSeleccionarPublicacion
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
            this.ucPublicacion_Listado1 = new FrbaCommerce.Controles.ucPublicacion_Listado();
            this.btnSeleccionar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ucPublicacion_Listado1
            // 
            this.ucPublicacion_Listado1.Location = new System.Drawing.Point(12, 12);
            this.ucPublicacion_Listado1.Name = "ucPublicacion_Listado1";
            this.ucPublicacion_Listado1.Size = new System.Drawing.Size(528, 417);
            this.ucPublicacion_Listado1.TabIndex = 0;
            // 
            // btnSeleccionar
            // 
            this.btnSeleccionar.Location = new System.Drawing.Point(414, 435);
            this.btnSeleccionar.Name = "btnSeleccionar";
            this.btnSeleccionar.Size = new System.Drawing.Size(75, 23);
            this.btnSeleccionar.TabIndex = 1;
            this.btnSeleccionar.Text = "Seleccionar";
            this.btnSeleccionar.UseVisualStyleBackColor = true;
            this.btnSeleccionar.Click += new System.EventHandler(this.btnSeleccionar_Click);
            // 
            // frmSeleccionarPublicacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(563, 477);
            this.Controls.Add(this.btnSeleccionar);
            this.Controls.Add(this.ucPublicacion_Listado1);
            this.Name = "frmSeleccionarPublicacion";
            this.Text = "frmSeleccionarPublicacion";
            this.Load += new System.EventHandler(this.frmSeleccionarPublicacion_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private FrbaCommerce.Controles.ucPublicacion_Listado ucPublicacion_Listado1;
        private System.Windows.Forms.Button btnSeleccionar;

    }
}