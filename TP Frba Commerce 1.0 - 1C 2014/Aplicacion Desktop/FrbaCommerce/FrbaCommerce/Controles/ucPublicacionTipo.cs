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
    public partial class ucPublicacionTipo : UserControl
    {
        public ucPublicacionTipo()
        {
            InitializeComponent();
        }

        public void Inicializar()
        {
            PublicacionController pc = new PublicacionController();
            cmb.DataSource = null;
            cmb.ValueMember = "tpub_id";
            cmb.DisplayMember = "tpub_descripcion";
            cmb.DataSource = pc.Tipos();
        }

        public Publicacion.eTipo getTipo()
        {
            PublicacionController pc = new PublicacionController();

            return pc.BuscarTipo(int.Parse(cmb.SelectedValue.ToString()));
            
        }

        public void setTipo(Publicacion.eTipo eTipo)
        {
            cmb.SelectedValue = (int)eTipo;
        }
    }
}
