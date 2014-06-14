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
        private Cliente _cliente;
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

            _cliente = cliente;
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
            if (txtApellido.Text == string.Empty)
                errores += "\nIngresar apellido";
            if (txtMail.Text == string.Empty)
                errores += "\nIngresar mail";
            if (txtTelefono.Text == string.Empty)
                errores += "\nIngresar Telefono";
            if (txtCalle.Text == string.Empty)
                errores += "\nIngresar calle";
            if (txtNumero.Text == string.Empty)
                errores += "\nIngresar numero";
            if (txtPiso.Text == string.Empty)
                errores += "\nIngresar piso";
            if (txtDepto.Text == string.Empty)
                errores += "\nIngresar depto";
            if (txtLocalidad.Text == string.Empty)
                errores += "\nIngresar localidad";
            if (txtCUIL.Text == string.Empty)
                errores += "\nIngresar CUIL";
            



            Documento doc = ucDocumento1.getDocumento();
            if (doc.Numero == -1)
                errores += "\nIngresar numero documento";

            //si no hay errores ejecuto lsa validaciones
            if (errores == string.Empty)
            {
                ClienteController cc = new ClienteController();
                if (esAlta())
                {
                    if (cc.TelefonoExistente(txtTelefono.Text))
                    {
                        errores += "\nTelefono ya existente. ";
                    }

                    if (cc.DocumentoExistente(doc))
                    {
                        errores += "\nTipo y NroDoc ya existente. ";
                    }
                }
                else
                {
                    //es edicion, 
                    if (_cliente.Telefono != txtTelefono.Text && cc.TelefonoExistente(txtTelefono.Text))
                    {
                        errores += "\nTelefono ya existente. ";
                    }

                    if (_cliente.Documento.Tipo != doc.Tipo && _cliente.Documento.Numero != doc.Numero && cc.DocumentoExistente(doc))
                    {
                        errores += "\nTipo y NroDoc ya existente. ";
                    }
                }
            }
            
            return errores == string.Empty;
        }

        private bool esAlta()
        {
            return _cliente == null;
        }
    }
}
