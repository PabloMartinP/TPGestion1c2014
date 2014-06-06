namespace FrbaCommerce.Gestion_de_Preguntas
{
    partial class frmPreguntar
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
            this.btnPreguntar = new System.Windows.Forms.Button();
            this.txtPublicacion_ID = new System.Windows.Forms.TextBox();
            this.txtRespuesta = new System.Windows.Forms.RichTextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txtPublicacion_Descripcion = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnPreguntar
            // 
            this.btnPreguntar.Location = new System.Drawing.Point(449, 130);
            this.btnPreguntar.Name = "btnPreguntar";
            this.btnPreguntar.Size = new System.Drawing.Size(75, 23);
            this.btnPreguntar.TabIndex = 7;
            this.btnPreguntar.Text = "Preguntar";
            this.btnPreguntar.UseVisualStyleBackColor = true;
            this.btnPreguntar.Click += new System.EventHandler(this.btnPreguntar_Click);
            // 
            // txtPublicacion_ID
            // 
            this.txtPublicacion_ID.Location = new System.Drawing.Point(100, 20);
            this.txtPublicacion_ID.Name = "txtPublicacion_ID";
            this.txtPublicacion_ID.ReadOnly = true;
            this.txtPublicacion_ID.Size = new System.Drawing.Size(100, 20);
            this.txtPublicacion_ID.TabIndex = 6;
            // 
            // txtRespuesta
            // 
            this.txtRespuesta.Location = new System.Drawing.Point(100, 46);
            this.txtRespuesta.Name = "txtRespuesta";
            this.txtRespuesta.Size = new System.Drawing.Size(424, 78);
            this.txtRespuesta.TabIndex = 3;
            this.txtRespuesta.Text = "";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(44, 49);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Pregunta";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnPreguntar);
            this.groupBox2.Controls.Add(this.txtPublicacion_ID);
            this.groupBox2.Controls.Add(this.txtRespuesta);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.txtPublicacion_Descripcion);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Location = new System.Drawing.Point(12, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(551, 173);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Pregunta";
            // 
            // txtPublicacion_Descripcion
            // 
            this.txtPublicacion_Descripcion.Location = new System.Drawing.Point(206, 20);
            this.txtPublicacion_Descripcion.Name = "txtPublicacion_Descripcion";
            this.txtPublicacion_Descripcion.ReadOnly = true;
            this.txtPublicacion_Descripcion.Size = new System.Drawing.Size(318, 20);
            this.txtPublicacion_Descripcion.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(32, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(62, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Publicacion";
            // 
            // frmPreguntar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(572, 203);
            this.Controls.Add(this.groupBox2);
            this.Name = "frmPreguntar";
            this.Text = "frmPreguntar";
            this.Load += new System.EventHandler(this.frmPreguntar_Load);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnPreguntar;
        private System.Windows.Forms.TextBox txtPublicacion_ID;
        private System.Windows.Forms.RichTextBox txtRespuesta;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txtPublicacion_Descripcion;
        private System.Windows.Forms.Label label1;
    }
}