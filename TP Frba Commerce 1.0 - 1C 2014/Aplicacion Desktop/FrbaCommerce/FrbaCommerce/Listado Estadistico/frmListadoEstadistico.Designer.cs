namespace FrbaCommerce.Listado_Estadistico
{
    partial class frmListadoEstadistico
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.numAño = new System.Windows.Forms.NumericUpDown();
            this.numTrimestre = new System.Windows.Forms.NumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.gb = new System.Windows.Forms.GroupBox();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.rbtnMayorProdNoVend = new System.Windows.Forms.RadioButton();
            this.rbtnVendConMayorFact = new System.Windows.Forms.RadioButton();
            this.rbtnVendConMayorCalif = new System.Windows.Forms.RadioButton();
            this.rbtnClientesConMayorCantDePublSinCalif = new System.Windows.Forms.RadioButton();
            this.btnVer = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numAño)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numTrimestre)).BeginInit();
            this.gb.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnVer);
            this.groupBox1.Controls.Add(this.groupBox2);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.numTrimestre);
            this.groupBox1.Controls.Add(this.numAño);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(636, 171);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Top 5";
            // 
            // numAño
            // 
            this.numAño.Location = new System.Drawing.Point(489, 49);
            this.numAño.Maximum = new decimal(new int[] {
            3000,
            0,
            0,
            0});
            this.numAño.Minimum = new decimal(new int[] {
            1000,
            0,
            0,
            0});
            this.numAño.Name = "numAño";
            this.numAño.Size = new System.Drawing.Size(60, 20);
            this.numAño.TabIndex = 0;
            this.numAño.Value = new decimal(new int[] {
            1000,
            0,
            0,
            0});
            // 
            // numTrimestre
            // 
            this.numTrimestre.Location = new System.Drawing.Point(489, 75);
            this.numTrimestre.Maximum = new decimal(new int[] {
            4,
            0,
            0,
            0});
            this.numTrimestre.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numTrimestre.Name = "numTrimestre";
            this.numTrimestre.Size = new System.Drawing.Size(57, 20);
            this.numTrimestre.TabIndex = 1;
            this.numTrimestre.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(457, 51);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Año";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(433, 77);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Trimestre";
            // 
            // gb
            // 
            this.gb.Controls.Add(this.dgv);
            this.gb.Location = new System.Drawing.Point(12, 189);
            this.gb.Name = "gb";
            this.gb.Size = new System.Drawing.Size(636, 277);
            this.gb.TabIndex = 1;
            this.gb.TabStop = false;
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgv.Location = new System.Drawing.Point(3, 16);
            this.dgv.Name = "dgv";
            this.dgv.ReadOnly = true;
            this.dgv.Size = new System.Drawing.Size(630, 258);
            this.dgv.TabIndex = 0;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.rbtnClientesConMayorCantDePublSinCalif);
            this.groupBox2.Controls.Add(this.rbtnVendConMayorCalif);
            this.groupBox2.Controls.Add(this.rbtnVendConMayorFact);
            this.groupBox2.Controls.Add(this.rbtnMayorProdNoVend);
            this.groupBox2.Location = new System.Drawing.Point(24, 30);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(364, 120);
            this.groupBox2.TabIndex = 4;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Tipo";
            // 
            // rbtnMayorProdNoVend
            // 
            this.rbtnMayorProdNoVend.AutoSize = true;
            this.rbtnMayorProdNoVend.Checked = true;
            this.rbtnMayorProdNoVend.Location = new System.Drawing.Point(48, 19);
            this.rbtnMayorProdNoVend.Name = "rbtnMayorProdNoVend";
            this.rbtnMayorProdNoVend.Size = new System.Drawing.Size(304, 17);
            this.rbtnMayorProdNoVend.TabIndex = 0;
            this.rbtnMayorProdNoVend.TabStop = true;
            this.rbtnMayorProdNoVend.Text = "Vendedores con mayor cantidad de productos no vendidos";
            this.rbtnMayorProdNoVend.UseVisualStyleBackColor = true;
            // 
            // rbtnVendConMayorFact
            // 
            this.rbtnVendConMayorFact.AutoSize = true;
            this.rbtnVendConMayorFact.Location = new System.Drawing.Point(48, 42);
            this.rbtnVendConMayorFact.Name = "rbtnVendConMayorFact";
            this.rbtnVendConMayorFact.Size = new System.Drawing.Size(190, 17);
            this.rbtnVendConMayorFact.TabIndex = 1;
            this.rbtnVendConMayorFact.Text = "Vendedores con mayor facturacion";
            this.rbtnVendConMayorFact.UseVisualStyleBackColor = true;
            // 
            // rbtnVendConMayorCalif
            // 
            this.rbtnVendConMayorCalif.AutoSize = true;
            this.rbtnVendConMayorCalif.Location = new System.Drawing.Point(48, 65);
            this.rbtnVendConMayorCalif.Name = "rbtnVendConMayorCalif";
            this.rbtnVendConMayorCalif.Size = new System.Drawing.Size(212, 17);
            this.rbtnVendConMayorCalif.TabIndex = 2;
            this.rbtnVendConMayorCalif.Text = "Vendedores con mayores calificaciones";
            this.rbtnVendConMayorCalif.UseVisualStyleBackColor = true;
            // 
            // rbtnClientesConMayorCantDePublSinCalif
            // 
            this.rbtnClientesConMayorCantDePublSinCalif.AutoSize = true;
            this.rbtnClientesConMayorCantDePublSinCalif.Location = new System.Drawing.Point(48, 88);
            this.rbtnClientesConMayorCantDePublSinCalif.Name = "rbtnClientesConMayorCantDePublSinCalif";
            this.rbtnClientesConMayorCantDePublSinCalif.Size = new System.Drawing.Size(296, 17);
            this.rbtnClientesConMayorCantDePublSinCalif.TabIndex = 3;
            this.rbtnClientesConMayorCantDePublSinCalif.Text = "Clientes con mayor cantidad de publicaciones sin calificar";
            this.rbtnClientesConMayorCantDePublSinCalif.UseVisualStyleBackColor = true;
            // 
            // btnVer
            // 
            this.btnVer.Location = new System.Drawing.Point(474, 101);
            this.btnVer.Name = "btnVer";
            this.btnVer.Size = new System.Drawing.Size(75, 23);
            this.btnVer.TabIndex = 5;
            this.btnVer.Text = "Ver";
            this.btnVer.UseVisualStyleBackColor = true;
            this.btnVer.Click += new System.EventHandler(this.btnVer_Click);
            // 
            // frmListadoEstadistico
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(667, 479);
            this.Controls.Add(this.gb);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmListadoEstadistico";
            this.Text = "frmListadoEstadistico";
            this.Load += new System.EventHandler(this.frmListadoEstadistico_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numAño)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numTrimestre)).EndInit();
            this.gb.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown numTrimestre;
        private System.Windows.Forms.NumericUpDown numAño;
        private System.Windows.Forms.GroupBox gb;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.RadioButton rbtnMayorProdNoVend;
        private System.Windows.Forms.RadioButton rbtnClientesConMayorCantDePublSinCalif;
        private System.Windows.Forms.RadioButton rbtnVendConMayorCalif;
        private System.Windows.Forms.RadioButton rbtnVendConMayorFact;
        private System.Windows.Forms.Button btnVer;
    }
}