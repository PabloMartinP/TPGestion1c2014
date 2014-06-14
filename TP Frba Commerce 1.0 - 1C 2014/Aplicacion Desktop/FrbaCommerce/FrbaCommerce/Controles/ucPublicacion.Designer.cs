namespace FrbaCommerce.Controles
{
    partial class ucPublicacion
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.chkPreguntas = new System.Windows.Forms.CheckBox();
            this.txtPrecio = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.numStock = new System.Windows.Forms.NumericUpDown();
            this.label2 = new System.Windows.Forms.Label();
            this.txtDescripcion = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.ucFecha = new FrbaCommerce.Controles.ucFechas();
            this.ucPublicacionTipo1 = new FrbaCommerce.Controles.ucPublicacionTipo();
            this.ucPublicacionEstado1 = new FrbaCommerce.Controles.ucPublicacionEstado();
            this.ucVisibilidad1 = new FrbaCommerce.Controles.ucVisibilidad();
            this.ucRubros1 = new FrbaCommerce.Controles.ucRubros();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numStock)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.ucFecha);
            this.groupBox1.Controls.Add(this.chkPreguntas);
            this.groupBox1.Controls.Add(this.ucPublicacionTipo1);
            this.groupBox1.Controls.Add(this.ucPublicacionEstado1);
            this.groupBox1.Controls.Add(this.ucVisibilidad1);
            this.groupBox1.Controls.Add(this.ucRubros1);
            this.groupBox1.Controls.Add(this.txtPrecio);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.numStock);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txtDescripcion);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(546, 321);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Publicacion";
            // 
            // chkPreguntas
            // 
            this.chkPreguntas.AutoSize = true;
            this.chkPreguntas.Location = new System.Drawing.Point(304, 193);
            this.chkPreguntas.Name = "chkPreguntas";
            this.chkPreguntas.Size = new System.Drawing.Size(111, 17);
            this.chkPreguntas.TabIndex = 10;
            this.chkPreguntas.Text = "Permitir Preguntas";
            this.chkPreguntas.UseVisualStyleBackColor = true;
            // 
            // txtPrecio
            // 
            this.txtPrecio.Location = new System.Drawing.Point(358, 112);
            this.txtPrecio.Name = "txtPrecio";
            this.txtPrecio.Size = new System.Drawing.Size(100, 20);
            this.txtPrecio.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(301, 115);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(37, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Precio";
            // 
            // numStock
            // 
            this.numStock.Location = new System.Drawing.Point(129, 113);
            this.numStock.Name = "numStock";
            this.numStock.Size = new System.Drawing.Size(120, 20);
            this.numStock.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(62, 115);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Stock";
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.Location = new System.Drawing.Point(129, 87);
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.Size = new System.Drawing.Size(377, 20);
            this.txtDescripcion.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(34, 90);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Descripcion";
            // 
            // ucFecha
            // 
            this.ucFecha.Fecha = new System.DateTime(2014, 6, 4, 0, 0, 0, 0);
            this.ucFecha.Formato = "dd/MM/yyyy";
            this.ucFecha.Location = new System.Drawing.Point(241, 157);
            this.ucFecha.Name = "ucFecha";
            this.ucFecha.Nombre = "Fecha";
            this.ucFecha.Size = new System.Drawing.Size(242, 30);
            this.ucFecha.TabIndex = 11;
            // 
            // ucPublicacionTipo1
            // 
            this.ucPublicacionTipo1.Location = new System.Drawing.Point(48, 26);
            this.ucPublicacionTipo1.Name = "ucPublicacionTipo1";
            this.ucPublicacionTipo1.Size = new System.Drawing.Size(213, 25);
            this.ucPublicacionTipo1.TabIndex = 9;
            this.ucPublicacionTipo1.SelectedValueChanged += new System.EventHandler(this.ucPublicacionTipo1_SelectedValueChanged);
            // 
            // ucPublicacionEstado1
            // 
            this.ucPublicacionEstado1.Location = new System.Drawing.Point(278, 27);
            this.ucPublicacionEstado1.Name = "ucPublicacionEstado1";
            this.ucPublicacionEstado1.Size = new System.Drawing.Size(205, 24);
            this.ucPublicacionEstado1.TabIndex = 8;
            // 
            // ucVisibilidad1
            // 
            this.ucVisibilidad1.Location = new System.Drawing.Point(42, 57);
            this.ucVisibilidad1.Name = "ucVisibilidad1";
            this.ucVisibilidad1.Size = new System.Drawing.Size(261, 24);
            this.ucVisibilidad1.TabIndex = 7;
            // 
            // ucRubros1
            // 
            this.ucRubros1.Location = new System.Drawing.Point(48, 139);
            this.ucRubros1.Name = "ucRubros1";
            this.ucRubros1.Size = new System.Drawing.Size(180, 131);
            this.ucRubros1.TabIndex = 6;
            // 
            // ucPublicacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.groupBox1);
            this.Name = "ucPublicacion";
            this.Size = new System.Drawing.Size(546, 321);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numStock)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.NumericUpDown numStock;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtDescripcion;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtPrecio;
        private System.Windows.Forms.Label label3;
        private FrbaCommerce.Controles.ucRubros ucRubros1;
        private FrbaCommerce.Controles.ucVisibilidad ucVisibilidad1;
        private FrbaCommerce.Controles.ucPublicacionEstado ucPublicacionEstado1;
        private FrbaCommerce.Controles.ucPublicacionTipo ucPublicacionTipo1;
        private System.Windows.Forms.CheckBox chkPreguntas;
        private FrbaCommerce.Controles.ucFechas ucFecha;
    }
}
