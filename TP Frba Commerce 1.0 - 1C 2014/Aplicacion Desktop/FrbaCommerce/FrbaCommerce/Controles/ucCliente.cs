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
    public partial class ucCliente : UserControl
    {
        public void setCliente(Cliente cliente)
        {
            txtNombre.Text = cliente.Nombre;
            txtApellido.Text = cliente.Apellido;
            ucDocumento1.setDocumento(cliente.Documento);
            txtMail.Text = cliente.Mail;
            txtTelefono.Text = cliente.Telefono;
            txtCalle.Text = cliente.Calle;
            txtNumero.Text = cliente.Numero.ToString();
            txtPiso.Text = cliente.Piso.ToString();
            txtDepto.Text = cliente.Depto;
            txtLocalidad.Text = cliente.Localidad;
            txtCodPostal.Text = cliente.CodPostal;
            ucFechas1.Fecha = cliente.FechaNac;
            txtCUIL.Text = cliente.CUIL.ToString();
        }

        public Cliente getCliente()
        {
            Cliente cliente = new Cliente();

            cliente.Nombre = txtNombre.Text;
            cliente.Apellido = txtApellido.Text;
            cliente.Documento = ucDocumento1.getDocumento();

            cliente.Mail = txtMail.Text;
            cliente.Telefono = txtTelefono.Text;
            cliente.Calle = txtCalle.Text;
            cliente.Numero = int.Parse(txtNumero.Text);
            cliente.Piso = int.Parse(txtPiso.Text);
            cliente.Depto = txtDepto.Text;
            cliente.Localidad = txtLocalidad.Text;
            cliente.CodPostal = txtCodPostal.Text;
            cliente.FechaNac = ucFechas1.Fecha;
            cliente.CUIL = txtCUIL.Text;

            return cliente;
        }

        public ucCliente()
        {
            InitializeComponent();
        }

        private void ucCliente_Load(object sender, EventArgs e)
        {

        }

        public void Inicializar()
        {
            ucDocumento1.Inicializar();

        }

        public bool Validar(out string errores)
        {
            errores = string.Empty;

            if (txtNombre.Text == string.Empty)
                errores += "\nIngresar nombre";
            //faltan validaciones

            ClienteController cc = new ClienteController();
            if (cc.TelefonoExistente(txtTelefono.Text))
            {
                errores += "\nTelefono ya existente. ";
            }

            if (cc.DocumentoExistente(ucDocumento1.getDocumento()))
            {
                errores += "\nTipo y NroDoc ya existente. ";
            }


            return errores == string.Empty;
        }
    }
}
