using System;
using System.Linq;
using System.Windows.Forms;
using FrbaCommerce.Entity;
using FrbaCommerce.Controller;


namespace FrbaCommerce.AbmRol
{
    public partial class frmRol_Editar : Form
    {
        private Rol Rol;

        public frmRol_Editar(Rol rol)
        {
            InitializeComponent();
            this.Rol = rol;
        }

        private void frmRol_Editar_Load(object sender, EventArgs e)
        {
            ucRol1.Rol = this.Rol;

            ucRol1.CargarRol(this.Rol);

        }

        private void Cancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            Rol rol = this.Rol;
            rol = ucRol1.ObtenerRol();
            rol.ID = Rol.ID;
			if (IsValid(rol))
			{
				//modifica el rol y el listado de funcionalidades
				RolController cRol = new RolController();
				cRol.Modificar(rol);

				MessageBox.Show("Modificado.", this.Text);

				this.Close();
			}
        }

		private bool IsValid(Rol rol)
		{
			bool bOk = true;
			string msg = "";

			if (!rol.Funcionalidades.Any(m => m.Permitida))
			{
				msg = "El rol debe tener al menos una funcionalidad asignada";
				bOk = false;
			}

			if (rol.Nombre.Trim() == string.Empty)
			{
				msg = "El rol debe tener un nombre que lo identifique";
			}

			if (!bOk)
				MessageBox.Show(msg, "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);

			return bOk;
		}
    }
}
