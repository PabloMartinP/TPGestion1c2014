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

namespace FrbaCommerce.Login
{
    public partial class frmSeleccionarRol : Form
    {
        public frmSeleccionarRol()
        {
            InitializeComponent();
        }

        public void setRoles(DataTable dt)
        {
            cmbRol.DataSource = null;
            cmbRol.DataSource = dt;

            cmbRol.DisplayMember = "rol_nombre";
            cmbRol.ValueMember = "rol_id";
        }

        private void frmSeleccionarRol_Load(object sender, EventArgs e)
        {

        }

        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            RolController rc = new RolController();
            int rol_id = int.Parse(cmbRol.SelectedValue.ToString());

            Sesion.Usuario.Rol = rc.Buscar(rol_id);

            this.Close();
        }
    }
}
