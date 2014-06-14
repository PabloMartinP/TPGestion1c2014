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
    public partial class frmNuevoUsuarioEmpresa : Form
    {
        public frmNuevoUsuarioEmpresa()
        {
            InitializeComponent();
        }

        private bool Validar(out string errores)
        {
            errores = string.Empty;


            string erroresUsuario = string.Empty;
            ucUsuario1.Validar(out erroresUsuario);
            errores = errores + erroresUsuario;

            string erroresEmpresa = string.Empty;
            ucEmpresa1.Validar(out erroresEmpresa);
            errores = errores + erroresEmpresa;

            return errores == string.Empty;
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                string errores = string.Empty;
                if (this.Validar(out errores))
                {
                    Empresa empresa = new Empresa();
                    empresa = ucEmpresa1.getEmpresa();
                    empresa.Usuario = ucUsuario1.Usuario;

                    EmpresaController cc = new EmpresaController();
                    ConexionController.BeginTransaction();
                    cc.Agregar(empresa);
                    ConexionController.CommitTransaction();
                    MessageBox.Show("Agregado");
                    this.Close();
                }
                else
                {
                    ConexionController.RollbackTransaction();
                    MessageBox.Show(errores);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
                
            
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
