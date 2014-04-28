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

namespace FrbaCommerce.AbmRol
{
    public partial class frmRol_Eliminar : Form
    {
        private Rol Rol;
        public frmRol_Eliminar(Rol unRol)
        {
            InitializeComponent();

            this.Rol = unRol;


        }

        private void frmRol_Eliminar_Load(object sender, EventArgs e)
        {
            ucRol1.Rol = this.Rol;

            ucRol1.CargarRol(this.Rol);
            ucRol1.SoloLectura();

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Confirma Eliminacion?", this.Text, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button3) == DialogResult.Yes)
            {
                if (this.Rol.ID == 1 || this.Rol.ID == 2 || this.Rol.ID == 3)
                    MessageBox.Show("No se puede eliminar el Rol debido a que es un rol del sistema");
                else
                {
                    RolController cRol = new RolController();

                    cRol.Borrar(this.Rol.ID);

                    MessageBox.Show("Eliminado");
                    this.Close();
                }
 
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
