using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;
using FrbaCommerce.Gestion_de_Preguntas;
using FrbaCommerce.Controller;

namespace FrbaCommerce.Comprar_Ofertar
{
    public partial class frmCompraOferta : Form
    {
        private Publicacion _publicacion = null;
        public frmCompraOferta(Publicacion p)
        {
            InitializeComponent();

            _publicacion = p;
        }

        private void frmCompraOferta_Load(object sender, EventArgs e)
        {
            CargarPublicacion();
        }

        private void CargarPublicacion()
        {
            txtPublicacion_Id.Text = _publicacion.Id.ToString();
            txtPublicacion.Text = _publicacion.Descripcion;
            btnPreguntar.Enabled = _publicacion.Preguntas;
            
            string titulo, textoBoton, cantidadMonto;
            switch (_publicacion.Tipo)
            {
                case Publicacion.eTipo.CompraInmediata:
                    titulo = "Compra Inmediata";
                    textoBoton = "Comprar";
                    cantidadMonto = "Cantidad";
                    
                    numCantidadMonto.Minimum = 0;
                    numCantidadMonto.Maximum = _publicacion.Stock;
                    break;
                case Publicacion.eTipo.Subasta:
                    titulo = "Oferta";
                    textoBoton = "Ofertar";
                    cantidadMonto = "Monto";
                    

                    numCantidadMonto.Minimum = _publicacion.Precio;
                    break;
                default:
                    titulo = string.Empty;
                    textoBoton = string.Empty;
                    cantidadMonto = string.Empty;
                    break;
            }

            this.Text = titulo;
            this.btnComprarOfertar.Text = textoBoton;
            lblCantidadMonto.Text = cantidadMonto;
            
        }


        private void Preguntar_Click(object sender, EventArgs e)
        {
            string mensaje = string.Empty;
            PreguntaController pc = new PreguntaController();
            if (pc.Validar(_publicacion, out mensaje))
            {
                frmPreguntar frm = new frmPreguntar(_publicacion);
                //frm.MdiParent = this.MdiParent;
                frm.ShowDialog();

            }
            else
                MessageBox.Show(mensaje);
        }

        private void btnComprarOfertar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Confirmar " + this.Text + "?","", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                CompraController cc = new CompraController();

                switch (_publicacion.Tipo)
                {
                    case Publicacion.eTipo.CompraInmediata:

                        cc.Comprar(_publicacion.Id, numCantidadMonto.Value);
                        frmDatosCompra frm = new frmDatosCompra(_publicacion);
                        frm.ShowDialog();


                        break;
                    case Publicacion.eTipo.Subasta:
                        cc.Ofertar(_publicacion.Id, numCantidadMonto.Value);
                        MessageBox.Show("Oferta realizada");
                        
                        break;
                    default:
                        break;
                }

                this.Close();
            }
        }

    }
}
