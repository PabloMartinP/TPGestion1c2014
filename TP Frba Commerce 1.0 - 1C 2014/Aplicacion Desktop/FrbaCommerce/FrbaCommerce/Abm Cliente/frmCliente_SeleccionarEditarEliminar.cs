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
    public partial class frmCliente_SeleccionarEditarEliminar : Form
    {
        private FrbaCommerce.Entity.Enum.eTipoAccion _accion;
        public frmCliente_SeleccionarEditarEliminar(FrbaCommerce.Entity.Enum.eTipoAccion accion)
        {
            InitializeComponent();
            _accion = accion;

            switch (_accion)
            {
                case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:
                    btnEditar.Text = "Editar";
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:
                    btnEditar.Text = "Baja";
                    break;
                default:
                    break;
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            Cliente cliente = ucCliente_Listado1.getCliente();

            switch (_accion)
            {
                case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:
                    frmCliente_AltaEditar frm = new frmCliente_AltaEditar(FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion);
                    frm.setCliente(cliente);
                    frm.ShowDialog();

                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:
                    if (MessageBox.Show("Confirma eliminacion de cliente: " + cliente.Usuario.UserName, "Eliminacion cliente", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                    {
                        UsuarioController uc = new UsuarioController();
                        uc.Eliminar(cliente.Usuario.ID);


            
                    }
                    break;
                default:
                    break;
            }

            
        }

        private void frmCliente_SeleccionarEditar_Load(object sender, EventArgs e)
        {
            ucCliente_Listado1.Inicializar();
        }


    }
}
