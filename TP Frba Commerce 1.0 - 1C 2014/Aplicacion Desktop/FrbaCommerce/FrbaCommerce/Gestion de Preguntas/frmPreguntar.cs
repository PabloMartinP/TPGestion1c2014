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

namespace FrbaCommerce.Gestion_de_Preguntas
{
    public partial class frmPreguntar : Form
    {

        private Publicacion _publicacion = null;
        public frmPreguntar(Publicacion p)
        {
            InitializeComponent();

            _publicacion = p;
        }

        private void frmPreguntar_Load(object sender, EventArgs e)
        {
            cargaPublicacion(_publicacion);
        }

        private void cargaPublicacion(Publicacion p)
        {
            txtPublicacion_Descripcion.Text = p.Descripcion;
            txtPublicacion_ID.Text = p.Id.ToString();

            txtRespuesta.Text = string.Empty;
        }

        private void btnPreguntar_Click(object sender, EventArgs e)
        {

            PreguntaController pc = new PreguntaController();

            pc.Preguntar(_publicacion.Id, txtRespuesta.Text);

            MessageBox.Show("Pregunta hecha");
            this.Close();
        }
    }
}
