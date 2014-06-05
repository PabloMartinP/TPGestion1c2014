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
    public partial class ucPublicacion_Listado : UserControl
    {
        public ucPublicacion_Listado()
        {
            InitializeComponent();
        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            string descripcion = txtDescripcion.Text;
            PublicacionController pc = new PublicacionController();
            dgv.DataSource = pc.Filtrar(descripcion, Sesion.Usuario.ID);
        }
        public Publicacion getPublicacion()
        {
            Publicacion p = null;

            DataGridViewRow rw = dgv.CurrentRow;
            if (rw != null)
            {
                
                int codigoPublicacion = int.Parse(rw.Cells["publ_id"].Value.ToString());
                PublicacionController pc = new PublicacionController();
                p = pc.Buscar(codigoPublicacion);


            }

            return p;
        }
    }
}
