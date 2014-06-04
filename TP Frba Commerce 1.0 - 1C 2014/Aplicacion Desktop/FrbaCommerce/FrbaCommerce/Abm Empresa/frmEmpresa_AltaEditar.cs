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

namespace FrbaCommerce.Abm_Empresa
{
    public partial class frmEmpresa_AltaEditar : Form
    {
        private Empresa _empresa = null;
        FrbaCommerce.Entity.Enum.eTipoAccion _accion;
        public frmEmpresa_AltaEditar(FrbaCommerce.Entity.Enum.eTipoAccion accion)
        {
            InitializeComponent();

            _accion = accion;
        }

        public void setEmpresa(Empresa empresa)
        {
            ucEmpresa1.setEmpresa(empresa);
            _empresa = empresa;
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string errores = string.Empty;
            if (ucEmpresa1.Validar(out errores))
            {
                Empresa empresa;
                empresa = ucEmpresa1.getEmpresa();

                EmpresaController cc = new EmpresaController();
                UsuarioController uc = new UsuarioController();
                try
                {
                    ConexionController.BeginTransaction();

                    switch (_accion)
                    {
                        case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                            empresa.Usuario = uc.GenerarUsuarioEmpresa(empresa);
                            cc.Agregar(empresa);
                            break;
                        case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:
                            empresa.Usuario = _empresa.Usuario;

                            cc.Guardar(empresa);
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

        private void frmEmpresa_AltaEditar_Load(object sender, EventArgs e)
        {

        }
    }
}
