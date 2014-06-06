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

namespace FrbaCommerce.Gestion_de_Preguntas
{
    public partial class frmVerRespuestas : Form
    {
        public frmVerRespuestas()
        {
            InitializeComponent();
        }

        private void frmVerRespuestas_Load(object sender, EventArgs e)
        {
            cargarRespuestas();
        }

        private void cargarRespuestas()
        {
            dgv.DataSource = null;
            PreguntaController pc = new PreguntaController();

            dgv.DataSource = pc.Respuestas();            
        }

    }
}
