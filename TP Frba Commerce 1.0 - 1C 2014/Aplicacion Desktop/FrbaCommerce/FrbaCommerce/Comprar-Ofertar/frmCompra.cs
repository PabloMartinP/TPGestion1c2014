using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;
using FrbaCommerce.Controller;

namespace FrbaCommerce.Comprar_Ofertar
{
    public partial class frmCompra : Form
    {
        private Publicacion _publicacion = null;
        public frmCompra(Publicacion publicacion)
        {
            InitializeComponent();
            _publicacion = publicacion;
        }

        private void frmCompra_Load(object sender, EventArgs e)
        {
            txtPublicacion_Id.Text = _publicacion.Id.ToString();
            txtPublicacion.Text = _publicacion.Descripcion;

            numCantidad.Minimum = 0;
            numCantidad.Maximum = _publicacion.Stock;
        }

        private void btnComprar_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("Confirmar Compra?", "Compra Inmediata", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                CompraController oc = new CompraController();
                oc.Comprar(_publicacion.Id, numCantidad.Value);

                frmDatosCompra frm = new frmDatosCompra(_publicacion);
                frm.ShowDialog();

                this.Close();

            }
        }

        

    }
}
