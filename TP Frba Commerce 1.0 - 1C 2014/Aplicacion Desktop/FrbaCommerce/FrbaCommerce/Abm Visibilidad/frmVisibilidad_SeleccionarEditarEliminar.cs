using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Abm_Visibilidad
{
    public partial class frmVisibilidad_SeleccionarEditarEliminar : Form
    {
        FrbaCommerce.Entity.Enum.eTipoAccion _accion;
        public frmVisibilidad_SeleccionarEditarEliminar(FrbaCommerce.Entity.Enum.eTipoAccion accion)
        {
            InitializeComponent();

            _accion = accion;
        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {

            Visibilidad v = getVisibilidad();

            switch (_accion)
            {
                case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:

                    frmVisibilidad_AltaEditar frm = new frmVisibilidad_AltaEditar(FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion);
                    frm.setVisibilidad(v);
                    frm.ShowDialog();

                    btnFiltrar_Click(null, null);

                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:

                    if (MessageBox.Show("Confirma eliminacion de Visibilidad", "Eliminacion Visibilidad", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                    {
                        VisibilidadController vc = new VisibilidadController();
                        vc.Eliminar(v.Id);

                        btnFiltrar_Click(null, null);



                    }
                    break;
                default:
                    break;
            }
        }

        private Visibilidad getVisibilidad()
        {
            Visibilidad v = new Visibilidad();

            DataGridViewRow rw = dgv.CurrentRow;
            if (rw != null)
            {
                int codigo;
                int.TryParse(rw.Cells["visi_id"].Value.ToString(), out codigo);

                VisibilidadController vc = new VisibilidadController();
                v = vc.Buscar(codigo);
            }
            return v;
        }

        private void frmVisibilidad_SeleccionarEditarEliminar_Load(object sender, EventArgs e)
        {

        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            VisibilidadController vc = new VisibilidadController();


            string desc = txtDescripcion.Text;
            dgv.DataSource = null;
            dgv.DataSource = vc.Filtrar(desc);


        }
    }
}
