﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;
using FrbaCommerce.Entity;

namespace FrbaCommerce.RegistrarUsuario
{
    public partial class ucUsuario : UserControl
    {
        private Usuario.eTipo _tipo;
        public Usuario.eTipo Tipo
        {
            get { return _tipo; }
            set
            {
                switch (value)
                {
                    case Usuario.eTipo.Cliente:
                        this.txtRol.Text = "Cliente";
                        break;
                    case Usuario.eTipo.Empresa:
                        this.txtRol.Text = "Empresa";
                        break;
                    default:
                        break;
                }
                _tipo = value;
            }
        }

        public Usuario Usuario 
        {
            get 
            {
                Usuario unUser = new Usuario();

                unUser.UserName = txtUserName.Text;
                unUser.Password = txtPassword.Text;
                unUser.Tipo = this.Tipo;

                return unUser;
            }
        }

        public ucUsuario()
        {
            InitializeComponent();
        }


        public bool Validar(out string errores)        
        {            
            errores = "";

            if (txtUserName.Text == string.Empty)
                errores += "\nDebe ingresar username";
            else
            {
                UsuarioController uc = new UsuarioController();
                if (uc.Buscar(txtUserName.Text) != null)
                    errores += "\nYa existe el username";
            }

            if(txtPassword.Text==string.Empty)
                errores+="\nDebe ingresar password";
            if (txtPassword.Text != txtRePassword.Text)
                errores = errores + "\nLos Passwords no coincide.";

            return errores == "";
        }
                      
       
    }
}
