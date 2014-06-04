using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Abm_Empresa
{
    public partial class frmEmpresa_SeleccionarEditarEliminar : Form
    {
        private FrbaCommerce.Entity.Enum.eTipoAccion _accion;
        public frmEmpresa_SeleccionarEditarEliminar(FrbaCommerce.Entity.Enum.eTipoAccion accion)
        {
            InitializeComponent();

            _accion = accion;

            switch (_accion)
            {
                case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:
                    btnModificarEliminar.Text = "Modificar";
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:
                    btnModificarEliminar.Text = "Eliminar";
                    break;
                default:
                    break;
            }
        }

        private void btnModificarEliminar_Click(object sender, EventArgs e)
        {
            Empresa empresa = ucEmpresa_Listado1.getEmpresa();

            switch (_accion)
            {
                case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:
                    frmEmpresa_AltaEditar frm = new frmEmpresa_AltaEditar(FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion);
                    frm.setEmpresa(empresa);
                    frm.ShowDialog();

                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:
                    if (MessageBox.Show("Confirma eliminacion de Empresa: " + empresa.Usuario.UserName, "Eliminacion Empresa", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                    {
                        UsuarioController uc = new UsuarioController();
                        uc.Eliminar(empresa.Usuario.ID);

                    }
                    break;
                default:
                    break;
            }

        }
    }
}
