using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;


namespace FrbaCommerce.AbmRol
{
    public partial class frmRol_SeleccionEliminar : Form
    {
        public frmRol_SeleccionEliminar()
        {
            InitializeComponent();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            Rol rolSeleccionado = ucRol_Listado1.RolSeleccionado();

            if (rolSeleccionado == null)
            {
                MessageBox.Show("null");
            }
            else
            {
                frmRol_Eliminar frm = new frmRol_Eliminar(rolSeleccionado);
                
                frm.ShowDialog();

                ucRol_Listado1.LimpiarTodo();

            }
        }
     
    }
}
