using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controles
{
    public partial class ucVisibilidad : UserControl
    {
        public ucVisibilidad()
        {
            InitializeComponent();
        }

        public void Inicializar()
        {
            VisibilidadController vc = new VisibilidadController();
            cmb.DataSource = null;
            cmb.ValueMember = "Id";
            cmb.DisplayMember = "Descripcion";
            cmb.DataSource = vc.Visibilidades();

            
        }

        public FrbaCommerce.Entity.Visibilidad getVisibilidad()
        {
            Visibilidad v = new Visibilidad();

            VisibilidadController vc = new VisibilidadController();

            v = vc.Buscar(int.Parse(cmb.SelectedValue.ToString()));


            return v;
        }

        public void setVisibilidad(Visibilidad visibilidad)
        {
            cmb.SelectedValue = (int)visibilidad.Id;
        }
    }
}
