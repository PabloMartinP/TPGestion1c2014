using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaCommerce.Historial_Cliente
{
    public partial class frmHistorialCliente : Form
    {
        public enum Informes

        public frmHistorialCliente()
        {
            InitializeComponent();
        }

        private void frmHistorialCliente_Load(object sender, EventArgs e)
        {
            cargarGrilla(null);
        }

        private void cargarGrilla(DataTable dt)
        {
            dgv.DataSource = null;
            dgv.DataSource = dt;
        }

        private void btnVer_Click(object sender, EventArgs e)
        {

        }
    }
}
