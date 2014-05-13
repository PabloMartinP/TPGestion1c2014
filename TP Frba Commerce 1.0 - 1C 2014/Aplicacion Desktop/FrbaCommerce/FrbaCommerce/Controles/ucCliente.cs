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
        public Cliente Cliente 
        {
            get 
            {
                Cliente cliente = new Cliente();

                cliente.Nombre = txtNombre.Text;
                cliente.Apellido = txtApellido.Text;
                cliente.TipoDoc = (int)cmbTipoDoc.SelectedValue;
                cliente.Doc = txtDoc.Text;
                cliente.Mail = txtMail.Text;
                cliente.Telefono = txtTelefono.Text;
                cliente.Calle = txtCalle.Text;
                cliente.Numero = int.Parse(txtNumero.Text);                
                cliente.Piso = int.Parse(txtPiso.Text);
                cliente.Depto = txtDepto.Text;
                cliente.Localidad = txtLocalidad.Text;
                cliente.CodPostal = txtCodPostal.Text;
                cliente.FechaNac = ucFechas1.Fecha;
                
                return cliente;
            }
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
            ClienteController cc = new ClienteController();

            cmbTipoDoc.DataSource = cc.ObtenerTiposDocumento();

            cmbTipoDoc.DisplayMember = "descripcion";
            cmbTipoDoc.ValueMember = "codigo"; 

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
                        
            if (cc.DocumentoExistente(int.Parse(cmbTipoDoc.SelectedValue.ToString()), txtDoc.Text))
            //if (cc.DocumentoExistente(1, txtDoc.Text))//hardcodeado 1 mientras no esta la tabla tipo_doc
            {
                errores += "\nTipo y NroDoc ya existente. ";
            }


            return errores == string.Empty;
        }
    }
}
