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

namespace FrbaCommerce.Abm_Visibilidad
{
    public partial class frmVisibilidad_AltaEditar : Form
    {

        private Visibilidad _visibilidad = null;
        private FrbaCommerce.Entity.Enum.eTipoAccion _accion;
        public frmVisibilidad_AltaEditar(FrbaCommerce.Entity.Enum.eTipoAccion accion)
        {
            InitializeComponent();

            _accion = accion;
            switch (_accion)
            {
                case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                    this.Text = "Alta Visibilidad";
                    btnAgregarEditar.Text = "Agregar";
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:
                    this.Text = "Modificar Visibilidad";
                    btnAgregarEditar.Text = "Modificar";
                    break;
                case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:
                    break;
                default:
                    break;
            }
        }

        private void frmVisibilidad_AltaEditar_Load(object sender, EventArgs e)
        {

        }

        private void btnAgregarEditar_Click(object sender, EventArgs e)
        {

            string msj = string.Empty;
            if (validar(out msj))
            {
                Visibilidad v = ucVisibilidad1.getVisibilidad();

                VisibilidadController vc = new VisibilidadController();
                switch (_accion)
                {
                    case FrbaCommerce.Entity.Enum.eTipoAccion.Alta:
                        vc.Agregar(v);
                        MessageBox.Show("Agregado");
                        this.Close();
                        break;
                    case FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion:
                        v.Id = _visibilidad.Id;
                        vc.Modificar(v);
                        MessageBox.Show("Modificado");
                        this.Close();
                        break;
                    case FrbaCommerce.Entity.Enum.eTipoAccion.Baja:
                        break;
                    default:
                        break;
                }
            }
            else
                MessageBox.Show(msj);
        }

        private bool validar(out string msj)
        {
            msj = string.Empty;

            return msj == string.Empty;
        }


        public void setVisibilidad(Visibilidad v)
        {
            ucVisibilidad1.setVisibilidad(v);
            _visibilidad = v;
        }
    }
}
