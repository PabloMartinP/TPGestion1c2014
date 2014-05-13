using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;

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
                empresa.Cuidad = txtCiudad.Text;
                empresa.CUIT = txtCUIT.Text;
                empresa.Contacto = txtContacto.Text;
                empresa.FechaCreacion = ucFechaCreacion.Fecha;
                


                return empresa;
            } 
        }
        
        public ucEmpresa()
        {
            InitializeComponent();
        }


    }
}
