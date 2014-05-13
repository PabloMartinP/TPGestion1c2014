namespace FrbaCommerce.Controles
{
	partial class ucFechas
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

		#region Component Designer generated code

		/// <summary> 
		/// Required method for Designer support - do not modify 
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.lbTextoFecha = new System.Windows.Forms.Label();
            this.btSeleccionar = new System.Windows.Forms.Button();
            this.tbFecha = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // lbTextoFecha
            // 
            this.lbTextoFecha.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lbTextoFecha.Location = new System.Drawing.Point(3, 1);
            this.lbTextoFecha.Name = "lbTextoFecha";
            this.lbTextoFecha.Size = new System.Drawing.Size(105, 23);
            this.lbTextoFecha.TabIndex = 0;
            this.lbTextoFecha.Text = "Fecha: ";
            this.lbTextoFecha.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // btSeleccionar
            // 
            this.btSeleccionar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btSeleccionar.Location = new System.Drawing.Point(211, 3);
            this.btSeleccionar.Name = "btSeleccionar";
            this.btSeleccionar.Size = new System.Drawing.Size(74, 23);
            this.btSeleccionar.TabIndex = 2;
            this.btSeleccionar.Text = "Seleccionar";
            this.btSeleccionar.UseVisualStyleBackColor = true;
            this.btSeleccionar.Click += new System.EventHandler(this.OnSeleccionarClick);
            // 
            // tbFecha
            // 
            this.tbFecha.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.tbFecha.Location = new System.Drawing.Point(114, 4);
            this.tbFecha.Name = "tbFecha";
            this.tbFecha.ReadOnly = true;
            this.tbFecha.Size = new System.Drawing.Size(92, 20);
            this.tbFecha.TabIndex = 1;
            // 
            // ucFechas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btSeleccionar);
            this.Controls.Add(this.tbFecha);
            this.Controls.Add(this.lbTextoFecha);
            this.Name = "ucFechas";
            this.Size = new System.Drawing.Size(294, 30);
            this.ResumeLayout(false);
            this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Label lbTextoFecha;
		private System.Windows.Forms.Button btSeleccionar;
		private System.Windows.Forms.TextBox tbFecha;
	}
}
