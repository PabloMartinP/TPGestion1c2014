using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;
using FrbaCommerce.Controller;

namespace FrbaCommerce.Abm_Cliente
{
    public partial class ucCliente_Listado : UserControl
    {
        public ucCliente_Listado()
        {
            InitializeComponent();
        }

        public void Inicializar()
        {
            ucDocumento1.Inicializar();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            Documento documento = ucDocumento1.getDocumento();
            string mail = txtMail.Text;

            ClienteController cc = new ClienteController();
            dgvClientes.DataSource = cc.Filtrar(nombre, apellido, documento, mail);


        }

        public Cliente getCliente()
        {
            Cliente cliente = null;
            DataGridViewRow rw = dgvClientes.CurrentRow;
            if (rw != null)
            {
                int codigo;
                int.TryParse(rw.Cells["clie_usuario"].Value.ToString(), out codigo);
                
                ClienteController cc = new ClienteController();
                cliente = cc.Buscar(codigo);
                
            }

            return cliente;
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }

        private void LimpiarCampos()
        {
            this.txtNombre.Text = string.Empty;
            this.txtApellido.Text = string.Empty;
            this.txtMail.Text = string.Empty;
            this.ucDocumento1.Limpiar();
        }



    }
}
