using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Editar_Publicacion
{
    public partial class frmSeleccionarPublicacion : Form
    {
        private Publicacion _publicacion = null;
        public Publicacion getPublicacion()
        {
            return _publicacion;
        }
        public frmSeleccionarPublicacion()
        {
            InitializeComponent();
        }

        private void frmSeleccionarPublicacion_Load(object sender, EventArgs e)
        {

        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {            
            _publicacion = ucPublicacion_Listado1.getPublicacion();

            this.Close();
        }
    }
}
