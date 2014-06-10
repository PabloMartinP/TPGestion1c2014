using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Abm_Cliente;
using FrbaCommerce.Abm_Empresa;
using FrbaCommerce.Generar_Publicacion;
using FrbaCommerce.Editar_Publicacion;
using FrbaCommerce.Gestion_de_Preguntas;
using FrbaCommerce.Comprar_Ofertar;
using FrbaCommerce.Calificar_Vendedor;
using FrbaCommerce.Historial_Cliente;
using FrbaCommerce.Facturar_Publicaciones;
using FrbaCommerce.Entity;
using FrbaCommerce.Login;

namespace FrbaCommerce
{
    public partial class frmMDI : Form
    {

        public frmMDI()
        {
            InitializeComponent();
        }

        private void frmMDI_Load(object sender, EventArgs e)
        {
            if (Sesion.Usuario.PrimeraVez)
            {
                frmCambiarPassword frm = new frmCambiarPassword();

                frm.ShowDialog();

                if (!frm.CambioPassword)
                    this.Close();
                    
            }
        }

        private void altaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbmRol.frmRol_Agregar frm = new FrbaCommerce.AbmRol.frmRol_Agregar();
            frm.MdiParent = this;
            frm.Show();
        }

        private void modificarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbmRol.frmRol_SeleccionEditar frm = new FrbaCommerce.AbmRol.frmRol_SeleccionEditar();
            frm.MdiParent = this;
            frm.Show();
        }

        private void bajaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbmRol.frmRol_SeleccionEliminar frm = new FrbaCommerce.AbmRol.frmRol_SeleccionEliminar();
            frm.MdiParent = this;
            frm.Show();
        }

        private void listadoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbmRol.frmRol_Listado frm = new FrbaCommerce.AbmRol.frmRol_Listado();
            frm.MdiParent = this;
            frm.Show();
        }

        private void altaToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmCliente_AltaEditar frm = new frmCliente_AltaEditar(FrbaCommerce.Entity.Enum.eTipoAccion.Alta);
            frm.MdiParent = this;
            frm.Show();
        }

        private void modificarToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmCliente_SeleccionarEditarEliminar frm = new frmCliente_SeleccionarEditarEliminar(FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion);
            frm.MdiParent = this;
            frm.Show();
        }

        private void bajaToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmCliente_SeleccionarEditarEliminar frm = new frmCliente_SeleccionarEditarEliminar(FrbaCommerce.Entity.Enum.eTipoAccion.Baja);
            frm.MdiParent = this;
            frm.Show();
        }

        private void altaToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            frmEmpresa_AltaEditar frm = new frmEmpresa_AltaEditar(FrbaCommerce.Entity.Enum.eTipoAccion.Alta);
            frm.MdiParent = this;
            frm.Show();
        }

        private void modificacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmEmpresa_SeleccionarEditarEliminar frm = new frmEmpresa_SeleccionarEditarEliminar(FrbaCommerce.Entity.Enum.eTipoAccion.Modificacion);

            frm.MdiParent = this;
            frm.Show();
        }

        private void bajaToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            frmEmpresa_SeleccionarEditarEliminar frm = new frmEmpresa_SeleccionarEditarEliminar(FrbaCommerce.Entity.Enum.eTipoAccion.Baja);
            frm.MdiParent = this;
            frm.Show();
        }

        private void generarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmGenerarPublicacion frm = new frmGenerarPublicacion();
            frm.MdiParent = this;
            frm.Show();
        }

        private void editarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSeleccionarPublicacion frm = new frmSeleccionarPublicacion();

            frm.ShowDialog();

            if (frm.getPublicacion() != null)
            {
                frmEditarPublicacion frmp = new frmEditarPublicacion(frm.getPublicacion());
                frmp.MdiParent = this;
                frmp.Show();
            }


        }

        private void verRespuestasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmVerRespuestas frm = new frmVerRespuestas();
            frm.MdiParent = this;
            frm.Show();
        }

        private void respondePreguntasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmResponder frm = new frmResponder();
            frm.MdiParent = this;
            frm.Show();
        }

        private void comprarOfertarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSeleccionarPublicacionParaComprarOfertar frm = new frmSeleccionarPublicacionParaComprarOfertar();
            frm.MdiParent = this;
            frm.Show();

        }

        private void calificarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmCalificar frm = new frmCalificar();
            frm.MdiParent = this;
            frm.Show();
        }

        private void historialToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmHistorialCliente frm = new frmHistorialCliente();
            frm.MdiParent = this;
            frm.Show();
        }

        private void facturarPublicacionesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmFacturar frm = new frmFacturar();
            frm.MdiParent = this;
            frm.Show();
        }

        private void cambiarPasswordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmCambiarPassword frm = new frmCambiarPassword();
            frm.MdiParent = this;
            frm.Show();
        }
    }
}
