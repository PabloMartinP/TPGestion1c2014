using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;
using FrbaCommerce.Controller;

namespace FrbaCommerce.Controles
{
    public partial class ucEmpresa : UserControl
    {
        private Empresa _empresa = null;
        public void setEmpresa(Empresa empresa)
        {
            txtRazonSocial.Text = empresa.RazonSocial ;
            txtMail.Text = empresa.Mail;
            txtTelefono.Text = empresa.Telefono;
            txtCalle.Text= empresa.Calle ;
            txtNumero.Text = empresa.Numero.ToString();
            txtPiso.Text = empresa.Piso.ToString();
            txtDepto.Text = empresa.Depto.ToString();
             txtLocalidad.Text = empresa.Localidad.ToString();
            txtCodPostal.Text = empresa.CodPostal;
            txtCiudad.Text = empresa.Ciudad;
            txtCUIT.Text= empresa.CUIT ;
            txtContacto.Text = empresa.Contacto;
            ucFechaCreacion.Fecha = empresa.FechaCreacion ;

            _empresa = empresa;
        }

        public Empresa getEmpresa()
        {
            Empresa empresa = new Empresa();

            empresa.RazonSocial = txtRazonSocial.Text;
            empresa.Mail = txtMail.Text;
            empresa.Telefono = txtTelefono.Text;
            empresa.Calle = txtCalle.Text;
            empresa.Numero = int.Parse(txtNumero.Text);
            empresa.Piso = int.Parse(txtPiso.Text);
            empresa.Depto = txtDepto.Text;
            empresa.Localidad = txtLocalidad.Text;
            empresa.CodPostal = txtCodPostal.Text;
            empresa.Ciudad = txtCiudad.Text;
            empresa.CUIT = txtCUIT.Text;
            empresa.Contacto = txtContacto.Text;
            empresa.FechaCreacion = ucFechaCreacion.Fecha;

            return empresa;
        }

        
        public bool Validar(out string errores)        
        {
            errores = string.Empty;

            if (txtRazonSocial.Text == string.Empty)
                errores += "\nIngresar RazonSocial";
            //faltan validaciones


            if (esAlta())
            {
                EmpresaController cc = new EmpresaController();
                if (cc.RazonSocialExistente(txtRazonSocial.Text))
                {
                    errores += "\nRazon Social ya existente. ";
                }

                //FALTA VALIDACION CUIT
                if (cc.CUITExistente(txtCUIT.Text))
                {
                    errores += "\nCUIT ya existente. ";
                }
            }
            else
            {
                EmpresaController cc = new EmpresaController();
                if (_empresa.RazonSocial !=txtRazonSocial.Text && cc.RazonSocialExistente(txtRazonSocial.Text))
                {
                    errores += "\nRazon Social ya existente. ";
                }

                //FALTA VALIDACION CUIT
                if (_empresa.CUIT!=txtCUIT.Text && cc.CUITExistente(txtCUIT.Text))
                {
                    errores += "\nCUIT ya existente. ";
                }
            }
            return errores == string.Empty;
        }

        private bool esAlta()
        {
            return _empresa == null;
        }

        public ucEmpresa()
        {
            InitializeComponent();
        }


    }
}
