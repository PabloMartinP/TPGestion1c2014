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

namespace FrbaCommerce.Comprar_Ofertar
{
    public partial class frmDatosCompra : Form
    {
        private Publicacion _publicacion = null;
        public frmDatosCompra(Publicacion publicacion)
        {
            InitializeComponent();

            _publicacion = publicacion;
            
        
        }

        private void frmComprar_Load(object sender, EventArgs e)
        {
            MostrarPublicacion();
        }

        private void MostrarPublicacion()
        {
            txtPublicacion.Text = _publicacion.Descripcion;

            MostrarDatosVendedor();
        }

        private void MostrarDatosVendedor()
        {
            switch (_publicacion.Usuario.Tipo)
            {
                case Usuario.eTipo.Cliente:
                    ClienteController cc = new ClienteController();
                    Cliente c = cc.Buscar(_publicacion.Usuario.ID);
                    
                    txtTelefono.Text = c.Telefono;
                    txtDireccion.Text = c.Calle;
                    txtNumero.Text = c.Numero.ToString();
                    
                    break;
                case Usuario.eTipo.Empresa:
                    EmpresaController ec = new EmpresaController();
                    Empresa e = ec.Buscar(_publicacion.Usuario.ID);

                    txtTelefono.Text = e.Telefono;
                    txtDireccion.Text = e.Calle;
                    txtNumero.Text = e.Numero.ToString();
                    
                    break;
                default:
                    break;
            }
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}
