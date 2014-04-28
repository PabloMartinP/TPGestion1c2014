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
    public partial class frmRol_SeleccionEditar : Form
    {
        public frmRol_SeleccionEditar()
        {
            InitializeComponent();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            Rol rolSeleccionado = ucRol_Listado1.RolSeleccionado();

            if (rolSeleccionado == null)
            {
                MessageBox.Show("null");
            }
            else
            {
                frmRol_Editar frm = new frmRol_Editar(rolSeleccionado);

                frm.ShowDialog();

                ucRol_Listado1.LimpiarTodo();

            }
        }

        private void frmRol_SeleccionEditar_Load(object sender, EventArgs e)
        {
            
        }

        private void ucRol_Listado1_Load(object sender, EventArgs e)
        {

        }
    }
}
