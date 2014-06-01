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
            string errores = string.Empty;
            if (ucCliente1.Validar(out errores))
            {
                Cliente cliente;
                cliente = ucCliente1.getCliente();

                ClienteController cc = new ClienteController();
                UsuarioController uc = new UsuarioController();
                try
                {
                    ConexionController.BeginTransaction();
                    cliente.Usuario = uc.GenerarUsuarioCliente(cliente);
                    cc.Agregar(cliente);
                    ConexionController.CommitTransaction();
                    MessageBox.Show("Agregado");
                    this.Close();
                }
                catch (Exception ex)
                {
                    ConexionController.RollbackTransaction();
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show(errores);

            }

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmCliente_Alta_Load(object sender, EventArgs e)
        {
            ucCliente1.Inicializar();
        }
    }
}
