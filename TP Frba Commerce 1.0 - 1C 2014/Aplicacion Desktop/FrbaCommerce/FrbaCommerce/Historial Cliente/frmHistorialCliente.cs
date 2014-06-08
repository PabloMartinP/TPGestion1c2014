using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;

namespace FrbaCommerce.Historial_Cliente
{
    public partial class frmHistorialCliente : Form
    {
        

        public frmHistorialCliente()
        {
            InitializeComponent();
        }

        private void frmHistorialCliente_Load(object sender, EventArgs e)
        {
            cargarGrilla(null);
        }

        private void cargarGrilla(DataTable dt)
        {
            dgv.DataSource = null;
            dgv.DataSource = dt;
        }

        private void btnVer_Click(object sender, EventArgs e)
        {
            ClienteController cc = new ClienteController();

            cargarGrilla(cc.Historial(getTipoInforme()));
        }

        private Entity.Enum.eTipoHistorialCliente getTipoInforme()
        {

            if (rbtnCalificaciones.Checked)
                return Entity.Enum.eTipoHistorialCliente.Calificaciones;
            else if (rbtnCompras.Checked)
                return Entity.Enum.eTipoHistorialCliente.Compras;
            else //if (rbtnOfertas.Checked)
                return Entity.Enum.eTipoHistorialCliente.Ofertas;

        }
    }
}
