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
    public partial class frmCliente_AltaEditar : Form
    {

        private Cliente _cliente = null;
        private FrbaCommerce.Entity.Enum.eTipoAccion _accion;
        public frmCliente_AltaEditar(FrbaCommerce.Entity.Enum.eTipoAccion accion)
        {
            InitializeComponent();

            _accion = accion;

        }

        public void setCliente(Cliente cliente)
        {
            _cliente = cliente;
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
                    switch (_accion)
                    {
                        case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                            cliente.Usuario = uc.GenerarUsuarioCliente(cliente);
                            cc.Agregar(cliente);
                            break;
                        case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:
                            cliente.Usuario = _cliente.Usuario;

                            cc.Guardar(cliente);
                            break;
                        case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:
                            break;
                        default:
                            break;
                    }
                    ConexionController.CommitTransaction();
                    MessageBox.Show("Hecho");
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

            switch (_accion)
            {
                case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                    this.Text = "Alta Cliente";
                    btnAgregar.Text = "Agregar";
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:                    
                    ucCliente1.setCliente(this._cliente);

                    this.Text = "Edicion Cliente";
                    btnAgregar.Text = "Editar";
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:
                    break;
                default:
                    break;
            }
        }
    }
}
