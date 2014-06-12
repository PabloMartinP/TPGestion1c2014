using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;

namespace FrbaCommerce.Controles
{
    public partial class ucPago : UserControl
    {
        public ucPago()
        {
            InitializeComponent();
        }

        public void Inicializar()
        {
            FacturaController fc = new FacturaController();
            cmb.DataSource = null;
            cmb.ValueMember = "tpago_id";
            cmb.DisplayMember = "tpago_descripcion";
            cmb.DataSource = fc.Pagos();
        }

        public FrbaCommerce.Entity.Enum.eTipoPago getPago()
        {

            return (FrbaCommerce.Entity.Enum.eTipoPago)cmb.SelectedValue;

        }

    }
}
