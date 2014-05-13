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

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            Empresa empresa = new Empresa();
            empresa = ucEmpresa1.Empresa;
            empresa.Usuario = ucUsuario1.Usuario;
            
            EmpresaController cc = new EmpresaController();

            cc.Agregar(empresa);
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
