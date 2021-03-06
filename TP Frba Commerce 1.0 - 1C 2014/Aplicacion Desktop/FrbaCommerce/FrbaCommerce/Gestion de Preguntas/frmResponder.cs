﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Gestion_de_Preguntas
{
    public partial class frmResponder : Form
    {
        public frmResponder()
        {
            InitializeComponent();
        }

        private void frmResponder_Load(object sender, EventArgs e)
        {
            cargarPreguntas();
        }

        private void cargarPreguntas()
        {
            PreguntaController pc = new PreguntaController();

            dgv.DataSource = null;
            dgv.DataSource = pc.Preguntas();
        }

        private void dgv_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.RowIndex != -1)
                {
                    int preg_id = int.Parse(dgv.Rows[e.RowIndex].Cells[0].Value.ToString());
                    //guardo el IDRespuesta en el tag
                    txtRespuesta.Tag = preg_id;


                    int publ_id = int.Parse(dgv.Rows[e.RowIndex].Cells["publ_id"].Value.ToString());

                    PublicacionController pc = new PublicacionController();
                    Publicacion p = pc.Buscar(publ_id);

                    txtPublicacion_ID.Text = p.Id.ToString();
                    txtPublicacion_Descripcion.Text = p.Descripcion;

                    txtPregunta.Text = dgv.Rows[e.RowIndex].Cells["preg_descripcion"].Value.ToString();

                    txtRespuesta.Text = string.Empty;

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private bool validar(out string mensaje)
        {
            mensaje = string.Empty;

            if (txtPublicacion_ID.Text == string.Empty)
            {
                mensaje = "No selecciono una pregunta";
            }

            if (txtRespuesta.Text == string.Empty)
                mensaje += "\nNo escribio una respuesta";

            return mensaje == string.Empty;
        }

        private void btnResponder_Click(object sender, EventArgs e)
        {
            try
            {
                string mensaje = string.Empty;
            if(validar(out mensaje))
            {
                //guardo hace doble click sobre la pregunta
                //guardo el Preg_ID en el tag de txtrespuesta
                int preg_id = int.Parse(txtRespuesta.Tag.ToString());

                PreguntaController pc = new PreguntaController();

                pc.Responder(preg_id,txtRespuesta.Text);

                MessageBox.Show("Respondido");
                LimpiarCampos();
            }
            else
                MessageBox.Show(mensaje);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LimpiarCampos()
        {
            cargarPreguntas();

            txtRespuesta.Text = string.Empty;
            txtPublicacion_ID.Text = string.Empty;
            txtPublicacion_Descripcion.Text = string.Empty;
            //guardo el idRespuesta en el tag, por esolo limpio
            txtRespuesta.Tag = null;
        }

        
        
    }
}
