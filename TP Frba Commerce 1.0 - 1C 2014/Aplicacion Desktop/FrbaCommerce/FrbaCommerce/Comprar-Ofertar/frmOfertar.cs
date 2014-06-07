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

namespace FrbaCommerce.Comprar_Ofertar
{
    public partial class frmOfertar : Form
    {
        private Publicacion _publicacion = null;
        public frmOfertar(Publicacion publicacion)
        {
            InitializeComponent();

            _publicacion = publicacion;
        }

        private void frmOfertar_Load(object sender, EventArgs e)
        {
            txtPublicacion_Id.Text = _publicacion.Id.ToString();
            txtPublicacion.Text = _publicacion.Descripcion;

            numOferta.Minimum = _publicacion.Precio;
        }

        private void btnOfertar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Confirmar Oferta?", "Subasta", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                OfertaController cc = new OfertaController();
                cc.Ofertar(_publicacion.Id, numOferta.Value);


                MessageBox.Show("Oferta");
                this.Close();

            }
        }
    }
}
