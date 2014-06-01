using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Abm_Cliente
{
    public partial class frmCliente_SeleccionarEditar : Form
    {
        public frmCliente_SeleccionarEditar()
        {
            InitializeComponent();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            Cliente cliente = ucCliente_Listado1.getCliente();

            frmCliente_Editar frm = new frmCliente_Editar(cliente);
            frm.MdiParent = this.MdiParent;

            frm.Show();
        }

        private void frmCliente_SeleccionarEditar_Load(object sender, EventArgs e)
        {
            ucCliente_Listado1.Inicializar();
        }


    }
}
