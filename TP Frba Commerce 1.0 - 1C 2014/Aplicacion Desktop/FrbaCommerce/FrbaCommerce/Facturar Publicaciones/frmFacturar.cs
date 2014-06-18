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

namespace FrbaCommerce.Facturar_Publicaciones
{
    public partial class frmFacturar : Form
    {
        public frmFacturar()
        {
            InitializeComponent();
        }

        private void btnVer_Click(object sender, EventArgs e)
        {
            FacturaController fc = new FacturaController();


            cargarGrilla(fc.ComprasParaFacturar(int.Parse(numCantidad.Value.ToString()), chkIncluirPublicaciones.Checked));

            CalcularTotales();


        }

        private void CalcularTotales()
        {
            decimal total = 0;
            decimal precio = 0, cantidad = 0;
            foreach (DataGridViewRow rw in dgv.Rows)
            {
                precio = decimal.Parse(rw.Cells["precio"].Value.ToString());
                cantidad = int.Parse(rw.Cells["cantidad"].Value.ToString());

                total = total + cantidad * precio;
            }

            txtTotal.Text = total.ToString();
        }

        private void cargarGrilla(DataTable dt)
        {
            dgv.DataSource = null;
            dgv.DataSource = dt;

            dgv.Columns[0].Visible = false;
            dgv.Columns[1].Visible = false;
        }

        private void btnFacturar_Click(object sender, EventArgs e)
        {
            FacturaController fc = new FacturaController();

            Factura f = getFactura();


            try
            {
                ConexionController.BeginTransaction();
                fc.Facturar(f);

                MessageBox.Show("Facturado");
                dgv.DataSource = null;
                ConexionController.CommitTransaction();

            }
            catch (Exception ex)
            {
                ConexionController.RollbackTransaction();
                MessageBox.Show(ex.Message.ToString());
            }



        }

        private Factura getFactura()
        {
            Factura f = new Factura();

            f.Cabecera = getCabecera();
            f.Items = getItems();

            return f ;
        }

        private List<Detalle> getItems()
        {
            List<Detalle> lista = new List<Detalle>();
            Detalle item = null;
            foreach (DataGridViewRow rw in dgv.Rows)
            {
                item = new Detalle();

                item.Cantidad = int.Parse(rw.Cells["Cantidad"].Value.ToString());
                item.Monto = decimal.Parse(rw.Cells["Precio"].Value.ToString());
                item.Publicacion = int.Parse(rw.Cells["Publ_id"].Value.ToString());
                item.Comp_Id = int.Parse(rw.Cells["Comp_Id"].Value.ToString());

                lista.Add(item);
            }

            return lista;
        }

        private Cabecera getCabecera()
        {
            Cabecera c = new Cabecera();

            c.Fecha = Config.FechaSistema;
            c.Usuario = Sesion.Usuario.ID;
            c.TipoPago = ucPago1.getPago();
            c.Total = decimal.Parse(txtTotal.Text);

            return c;
        }


        private void frmFacturar_Load(object sender, EventArgs e)
        {
            ucPago1.Inicializar();
        }

    }
}
