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
    public partial class ucRubros : UserControl
    {
        public ucRubros()
        {
            InitializeComponent();
        }
        public void Inicializar()
        {
            RubroController rc = new RubroController();


            clb.DataSource = rc.Rubros();

            clb.DisplayMember = "Descripcion";
            clb.ValueMember = "ID";
            //clb.Update();
        }

        public List<FrbaCommerce.Entity.Rubro> getRubros()
        {
            List<Rubro> lista = new List<Rubro>();

            foreach (Rubro r in clb.CheckedItems)
            {
                lista.Add(r);               
            }


            return lista;
        }

        public void setRubros(List<Rubro> rubros)
        {
            foreach (Rubro r in rubros)
            {
                int index = GetIndex(r);

                if (index > -1)
                {
                    clb.SetItemChecked(index, true);
                }
            }
        }
        private int GetIndex(Rubro rubro)
        {
            int index = 0;
            foreach (Rubro r in clb.Items)
            {
                if (r.ID == rubro.ID)
                {
                    return index;
                }
                index++;
            }
            return -1;
        }

    }
}
