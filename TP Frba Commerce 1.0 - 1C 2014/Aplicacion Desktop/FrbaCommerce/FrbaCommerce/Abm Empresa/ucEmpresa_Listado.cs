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

namespace FrbaCommerce.Abm_Empresa
{
    public partial class ucEmpresa_Listado : UserControl
    {
        public ucEmpresa_Listado()
        {
            InitializeComponent();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            string razonSocial = txtRazonSocial.Text;
            string cuit = txtCUIT.Text;
            string mail = txtMail.Text;

            EmpresaController ec = new EmpresaController();
            dgv.DataSource = ec.Filtrar(razonSocial, cuit, mail);
        }

        public Empresa getEmpresa()
        {
            Empresa empresa = null;
            DataGridViewRow rw = dgv.CurrentRow;
            if (rw != null)
            {
                int codigo;
                int.TryParse(rw.Cells["empr_usuario"].Value.ToString(), out codigo);

                EmpresaController cc = new EmpresaController();
                empresa = cc.Buscar(codigo);

            }

            return empresa;
        }

    }
}
