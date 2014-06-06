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

namespace FrbaCommerce.Comprar_Ofertar
{
    public partial class frmSeleccionarPublicacionParaComprarOfertar : Form
    {
        private Publicacion _publicacion = null;
        public Publicacion getPublicacion()
        {
            return _publicacion;
        }

        public frmSeleccionarPublicacionParaComprarOfertar()
        {
            InitializeComponent();
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            _publicacion = ucSeleccionarPublicacionCompraOferta1.getPublicacion();

        }

        private void frmSeleccionarPublicacionParaComprarOfertar_Load(object sender, EventArgs e)
        {
            ucSeleccionarPublicacionCompraOferta1.Inicializar();
        }

        private bool validarPregunta(out string mensaje)
        {
            mensaje = string.Empty;

            //validar 

            return mensaje == string.Empty;
        }

        private void btnPreguntar_Click(object sender, EventArgs e)
        {
            string mensaje = string.Empty;

            if(validarPregunta(out mensaje))
            {
                Publicacion p = ucSeleccionarPublicacionCompraOferta1.getPublicacion();
                if (p != null)
                {
                    frmPreguntar frm = new frmPreguntar(p);
                    //frm.MdiParent = this.MdiParent;
                    frm.ShowDialog();
                }
            }
            else
                MessageBox.Show(mensaje);
            
            
        }

        private void btnComprarOfertar_Click(object sender, EventArgs e)
        {


        }


        
    }
}
