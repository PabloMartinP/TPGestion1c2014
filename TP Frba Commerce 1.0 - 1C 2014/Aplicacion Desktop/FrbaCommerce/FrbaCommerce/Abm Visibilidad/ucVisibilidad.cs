using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Abm_Visibilidad
{
    public partial class ucVisibilidad : UserControl
    {
        public ucVisibilidad()
        {
            InitializeComponent();
        }

        private void Inicializar()
        { 

        }

        public Visibilidad getVisibilidad()
        {
            Visibilidad v = new Visibilidad();

            v.Codigo = int.Parse(txtCodigo.Text);
            v.Descripcion = txtDescripcion.Text;
            v.Precio = decimal.Parse(txtPrecio.Text);
            v.Porcentaje = decimal.Parse(txtPorcentaje.Text);
            v.DuracionDias = int.Parse(txtDuracionDias.Text);
            v.Prioridad = int.Parse(txtPrioridad.Text);

            return v;
        }

        public void setVisibilidad(Visibilidad v)
        {
            txtCodigo.Text = v.Codigo.ToString();
            txtDescripcion.Text = v.Descripcion;
            txtPrecio.Text = v.Precio.ToString();
            txtPorcentaje.Text = v.Porcentaje.ToString();
            txtDuracionDias.Text = v.DuracionDias.ToString();
            txtPrioridad.Text = v.Prioridad.ToString();
        }

    }
}
