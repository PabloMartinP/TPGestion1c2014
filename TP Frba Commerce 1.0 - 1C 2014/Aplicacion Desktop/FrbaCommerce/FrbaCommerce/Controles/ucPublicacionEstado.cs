using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controles
{
    public partial class ucPublicacionEstado : UserControl
    {
        public ucPublicacionEstado()
        {
            InitializeComponent();
        }

        public void Inicializar()
        {

            PublicacionController pc = new PublicacionController();
            cmb.DataSource = null;
            cmb.ValueMember = "epub_id";
            cmb.DisplayMember = "epub_descripcion";
            cmb.DataSource = pc.Estados();
        }

        public Publicacion.eEstado getEstado()
        {
            PublicacionController vc = new PublicacionController();

            return vc.BuscarEstado(int.Parse(cmb.SelectedValue.ToString()));
        }

        public void setEstado(Publicacion.eEstado eEstado)
        {
            cmb.SelectedValue = (int)eEstado;
        }
    }
}
