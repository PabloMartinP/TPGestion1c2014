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

namespace FrbaCommerce.Abm_Cliente
{
    public partial class frmCliente_Alta : Form
    {
        public frmCliente_Alta()
        {
            InitializeComponent();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Cliente cliente;

            cliente = ucCliente1.Cliente;

            ClienteController cc = new ClienteController();
            
            cc.Agregar(cliente);
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmCliente_Alta_Load(object sender, EventArgs e)
        {

        }
    }
}
