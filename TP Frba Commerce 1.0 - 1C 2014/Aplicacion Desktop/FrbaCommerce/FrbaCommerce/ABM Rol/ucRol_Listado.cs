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

namespace FrbaCommerce.AbmRol
{
    public partial class ucRol_Listado : UserControl
    {
        public enum eRol
        { 
            Rol_ID=0,
            Rol_Nombre=1
        }
        public ucRol_Listado()
        {
            InitializeComponent();
        }
        public Rol RolSeleccionado()
        {
            try
            {
                Rol rol = new Rol();

                int filaSeleccionada = dgvRoles.CurrentCell.RowIndex;

                rol.ID =(int) dgvRoles[0, filaSeleccionada].Value;

                RolController cRol = new RolController();
                rol=cRol.Buscar(rol.ID);
                
                return rol;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        private void ucRol_Listado_Load(object sender, EventArgs e)
        {

        }
      
        private void cmbBuscar_Click(object sender, EventArgs e)
        {
            Rol rol = new Rol();

            rol.Nombre = txtNombre.Text;

            RolController cRol = new RolController();

            dgvRoles.DataSource = cRol.Filtrar(rol);
            dgvRoles.Columns[(int)eRol.Rol_ID].Visible = false;         
        }

        public void LimpiarTodo()
        {
            cmbLimpiar_Click(null, null);
        }

        private void cmbLimpiar_Click(object sender, EventArgs e)
        {
            dgvRoles.DataSource = null;

            //ucRol1.LimpiarTodo();
            txtNombre.Text = string.Empty;
        }

        
    }
}
