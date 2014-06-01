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
    public partial class frmCliente_Editar : Form
    {

        private Cliente _cliente;
        public frmCliente_Editar(Cliente cliente)
        {
            InitializeComponent();
            _cliente = cliente;
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            Cliente cliente = ucCliente1.getCliente();
            cliente.Usuario = _cliente.Usuario;
            
            ClienteController cc = new ClienteController();

            cc.Guardar(cliente);
            MessageBox.Show("modificado");
            this.Close();

        }

        private void frmCliente_Editar_Load(object sender, EventArgs e)
        {
            ucCliente1.Inicializar();

            ucCliente1.setCliente(this._cliente);


        }
    }
}
