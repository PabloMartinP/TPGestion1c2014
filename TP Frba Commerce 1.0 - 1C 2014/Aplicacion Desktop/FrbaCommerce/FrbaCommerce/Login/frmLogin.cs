using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;
using FrbaCommerce.Registro_de_Usuario;

namespace FrbaCommerce.Login
{
    public partial class frmLogin : Form
    {
        public bool Login { get; set; }

        public frmLogin()
        {
            InitializeComponent();

            Login = false;
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            //TryLogIn();
            AbrirMDI();
        }

        private void TryLogIn()
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;

            //si loguea OK abro el MDI
            UsuarioController uc = new UsuarioController();
            if (uc.ValidarLogin(userName, password))
            {
                Sesion.Usuario = uc.Buscar(userName);
                AbrirMDI();
            }
            else
            {
                MessageBox.Show("Login error");
                AbrirMDI();
            }

        }
        private void AbrirMDI()
        {
            //cierro esto y que vuelva al program.cs
            Login = true;
            this.Close();
        }

        private void lnkTipoCliente_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            frmNuevoUsuarioCliente frm = new frmNuevoUsuarioCliente();
            //frm.MdiParent = this;
            frm.Show();
        }

        private void lnkTipoEmpresa_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            frmNuevoUsuarioEmpresa frm = new frmNuevoUsuarioEmpresa();
            //frm.MdiParent = this;
            frm.Show();
        }
    }
}
