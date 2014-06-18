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

namespace FrbaCommerce.Listado_Estadistico
{
    public partial class frmListadoEstadistico : Form
    {

        

        public frmListadoEstadistico()
        {
            InitializeComponent();
        }

        private void frmListadoEstadistico_Load(object sender, EventArgs e)
        {
            numAño.Value = Config.FechaSistema.Year;
        }

        private void btnVer_Click(object sender, EventArgs e)
        {
            try
            {
                ListadoEstadisticoController lc = new ListadoEstadisticoController();

                int año = int.Parse(numAño.Value.ToString());
                int trimestre = int.Parse(numTrimestre.Value.ToString());
                cargarGrilla(lc.getListado(año, trimestre, getTipo()));

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private FrbaCommerce.Controller.ListadoEstadisticoController.eListadoEstadistico getTipo()
        {
            ListadoEstadisticoController.eListadoEstadistico rs = ListadoEstadisticoController.eListadoEstadistico.CliePublSinCalif;

            if (rbtnMayorProdNoVend.Checked)
                rs = ListadoEstadisticoController.eListadoEstadistico.VendProdNoVend;
            else if (rbtnVendConMayorFact.Checked)
                rs = ListadoEstadisticoController.eListadoEstadistico.VendConFact;
            else if (rbtnVendConMayorCalif.Checked)
                rs = ListadoEstadisticoController.eListadoEstadistico.VendConCalif;
            else
                rs = ListadoEstadisticoController.eListadoEstadistico.CliePublSinCalif;

            return rs;            
        }

        private void cargarGrilla(DataTable dt)
        {
            dgv.DataSource = null;
            dgv.DataSource = dt;
        }
    }
}
