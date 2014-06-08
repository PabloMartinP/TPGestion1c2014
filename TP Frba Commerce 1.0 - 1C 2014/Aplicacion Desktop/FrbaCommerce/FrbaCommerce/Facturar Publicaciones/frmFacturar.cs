using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;

namespace FrbaCommerce.Facturar_Publicaciones
{
    public partial class frmFacturar : Form
    {
        public frmFacturar()
        {
            InitializeComponent();
        }

        private void btnVer_Click(object sender, EventArgs e)
        {
            FacturaController fc = new FacturaController();


            cargarGrilla(fc.ComprasAFacturar(int.Parse(numCantidad.Value.ToString())));


        }

        private void cargarGrilla(DataTable dt)
        {
            dgv.DataSource = null;
            dgv.DataSource = dt;
        }

        private void btnFacturar_Click(object sender, EventArgs e)
        {

        }

        private void frmFacturar_Load(object sender, EventArgs e)
        {
            ucPago1.Inicializar();
        }

    }
}
