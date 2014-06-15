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

namespace FrbaCommerce.Calificar_Vendedor
{
    public partial class frmCalificar : Form
    {
        public frmCalificar()
        {
            InitializeComponent();
        }

        private void frmCalificar_Load(object sender, EventArgs e)
        {
            CargarGrilla();
        }

        private void CargarGrilla()
        {
            CompraController cc = new CompraController();
            
            dgv.DataSource = null;
            dgv.DataSource = cc.ComprasSinCalificar();

        }

        private void btnCalificar_Click(object sender, EventArgs e)
        {
            try
            {
                string mensaje = string.Empty;
                if (validar(out mensaje))
                {

                    int compraOferId = int.Parse(numEstrellas.Tag.ToString());

                    CalificacionController pc = new CalificacionController();
                    Calificacion c = new Calificacion();

                    c.Descripcion = txtDescripcion.Text;
                    c.Estrellas = int.Parse(numEstrellas.Value.ToString());

                    int publ_id = int.Parse(txtPublicacion_ID.Text);
                    PublicacionController pubc = new PublicacionController();
                    c.Publicacion = pubc.Buscar(publ_id);

                    c.Compra_Oferta_Id = compraOferId;

                    try
                    {
                        ConexionController.BeginTransaction();
                        pc.Calificar(c);
                        ConexionController.CommitTransaction();
                        MessageBox.Show("Calificado");
                        LimpiarCampos();
                    }
                    catch (Exception ex)
                    {
                        ConexionController.RollbackTransaction();
                        MessageBox.Show(ex.Message);
                    }

                }
                else
                    MessageBox.Show(mensaje);
            }
            catch (Exception ex1)
            {
                MessageBox.Show(ex1.Message);
            }
        }

        private void LimpiarCampos()
        {
            CargarGrilla();

            txtDescripcion.Text = string.Empty;
            txtPublicacion_ID.Text = string.Empty;
            txtPublicacion_Descripcion.Text = string.Empty;
            //guardo el idRespuesta en el tag, por esolo limpio
            numEstrellas.Tag = null;
        }

        private bool validar(out string mensaje)
        {
            mensaje = string.Empty;

            if (txtPublicacion_ID.Text == string.Empty)
                mensaje = "Seleccionar publicacion";

            return mensaje == string.Empty;
        }

        private void dgv_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1)
            {
                int calif_id = int.Parse(dgv.Rows[e.RowIndex].Cells["comp_id"].Value.ToString());
                //guardo el idCalificacion en el tag
                numEstrellas.Tag = calif_id;



                int publ_id = int.Parse(dgv.Rows[e.RowIndex].Cells["publ_id"].Value.ToString());

                PublicacionController pc = new PublicacionController();
                Publicacion p = pc.Buscar(publ_id);

                txtPublicacion_ID.Text = p.Id.ToString();
                txtPublicacion_Descripcion.Text = p.Descripcion;

                txtDescripcion.Text = string.Empty;
                numEstrellas.Value = 1;

            }
        }
    }
}
