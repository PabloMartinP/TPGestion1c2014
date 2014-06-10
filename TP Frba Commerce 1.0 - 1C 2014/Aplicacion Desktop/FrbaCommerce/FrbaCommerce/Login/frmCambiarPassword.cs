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

namespace FrbaCommerce.Login
{
    public partial class frmCambiarPassword : Form
    {
        public frmCambiarPassword()
        {
            InitializeComponent();

            CambioPassword = false;
        }

        public bool CambioPassword { get; set; }

        private bool validar(out string mensaje)
        {
            mensaje = string.Empty;

            if (Sesion.Usuario.Password != txtPasswordAnterior.Text)
                mensaje = "El password no coincide con el actual";
            else
                if (txtPassword.Text != txtRePassword.Text)
                    mensaje = "Los password no coinciden";
            

            return mensaje == string.Empty;
        }

        private void btnCambiar_Click(object sender, EventArgs e)
        {
            string mensaje;
            if (validar(out mensaje))
            {
                UsuarioController uc = new UsuarioController();

                uc.CambiarPassword(txtPassword.Text);


                CambioPassword = false;
                MessageBox.Show("Password cambiado");
                this.Close();



            }
            else
                MessageBox.Show(mensaje);
        }

      


    }
}
