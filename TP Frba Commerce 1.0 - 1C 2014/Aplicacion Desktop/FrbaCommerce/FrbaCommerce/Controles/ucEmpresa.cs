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
        public Empresa Empresa 
        { 
            get 
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
        }

        
        public bool Validar(out string errores)        
        {
            errores = string.Empty;

            if (txtRazonSocial.Text == string.Empty)
                errores += "\nIngresar RazonSocial";
            //faltan validaciones

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
            
            

            return errores == string.Empty;
        }
        
        public ucEmpresa()
        {
            InitializeComponent();
        }


    }
}
