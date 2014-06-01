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

namespace FrbaCommerce.Registro_de_Usuario
{
    public partial class frmNuevoUsuarioCliente : Form
    {
        public frmNuevoUsuarioCliente()
        {
            InitializeComponent();
        }

        private bool Validar(out string errores)
        {
            errores = string.Empty;

            string erroresUsuario = string.Empty;
            ucUsuario1.Validar(out erroresUsuario);
            errores = errores + erroresUsuario;

            string erroresCliente = string.Empty;
            ucCliente1.Validar(out erroresCliente);
            errores = errores + erroresCliente;


            return errores == string.Empty;
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {

            string errores = string.Empty;
            if (Validar(out errores))
            {
                Cliente cliente = new Cliente();
                cliente = ucCliente1.getCliente();
                cliente.Usuario = ucUsuario1.Usuario;

                ClienteController cc = new ClienteController();

                try
                {
                    
                ConexionController.BeginTransaction();
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

        private void frmNuevoUsuarioCliente_Load(object sender, EventArgs e)
        {
            ucCliente1.Inicializar();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
