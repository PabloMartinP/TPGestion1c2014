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
    public partial class ucSeleccionarPublicacionCompraOferta : UserControl
    {
        public ucSeleccionarPublicacionCompraOferta()
        {
            InitializeComponent();
        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            string descripcion = txtDescripcion.Text;
            List<Rubro> rubros = ucRubros1.getRubros();
            
            PublicacionController pc = new PublicacionController();
            
            cargarGrilla(pc.ParaComprarOfertar(descripcion, rubros, Sesion.Usuario.ID));
        }

        private void cargarGrilla(DataTable dt)
        {
            dgv.DataSource = null;
            dgv.DataSource = dt;
        }

        public void Inicializar()
        {
            ucRubros1.Inicializar();
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
