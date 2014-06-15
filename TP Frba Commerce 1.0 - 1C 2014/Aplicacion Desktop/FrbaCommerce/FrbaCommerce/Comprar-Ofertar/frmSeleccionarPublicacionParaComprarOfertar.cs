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

            validarCalificacionesPendientes();
        }

        private void validarCalificacionesPendientes()
        {
            UsuarioController uc = new UsuarioController();
            
            if (uc.CalificacionesPendientes() > 5)
            {
                btnComprarOfertar.Enabled = false;
                lblMensajeCalificacionesPendientes.Visible = true;
            }            

        }

        private void btnComprarOfertar_Click(object sender, EventArgs e)
        {
            try
            {
                string msj = string.Empty;
                Publicacion p = ucSeleccionarPublicacionCompraOferta1.getPublicacion();

                if(validarCompraOferta(p, out msj))
                {
                    frmCompraOferta frm = new frmCompraOferta(p);
                    frm.ShowDialog();
                }
                else
                    MessageBox.Show(msj);

                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            


        }

        private bool validarCompraOferta(Publicacion p , out string msj)
        {
            msj = string.Empty;
            if (Sesion.Usuario.ID == p.Usuario.ID)
                msj+= "\nNo se puede autocomprarse/autoofertarse. ";


            return msj == string.Empty;
        }


        
    }
}
