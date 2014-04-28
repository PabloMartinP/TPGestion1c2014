using System;
using System.Linq;
using System.Windows.Forms;
using FrbaCommerce.Entity;
using FrbaCommerce.Controller;

namespace FrbaCommerce.AbmRol
{
    public partial class frmRol_Agregar : Form
    {
        public frmRol_Agregar()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string sErrores = ucRol1.ValidarCampos();

            if (sErrores == "")
            {
                try
                {
                    Rol rol;// = new Rol();
                    rol = ucRol1.ObtenerRol();

					if (IsValid(rol))
					{
						RolController cRol = new RolController();

						//agrega el rol y el listado de funcionalidades
                        ConexionController.BeginTransaction();
                        cRol.Agregar(rol);
                        ConexionController.CommitTransaction();
                        
						MessageBox.Show("Agregado.");

						this.Close();
					}
                }
                catch (Exception ex)
                {
                    ConexionController.RollbackTransaction();
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show(sErrores);
            }
        }

        private void frmRol_Agregar_Load(object sender, EventArgs e)
        {
            ucRol1.CargarFuncionalidades();
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
