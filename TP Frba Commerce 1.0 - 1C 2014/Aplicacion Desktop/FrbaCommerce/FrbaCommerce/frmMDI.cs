﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Abm_Cliente;

namespace FrbaCommerce
{
    public partial class frmMDI : Form
    {

        public frmMDI()
        {
            InitializeComponent();
        }

        private void frmMDI_Load(object sender, EventArgs e)
        {

        }

        private void altaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbmRol.frmRol_Agregar frm = new FrbaCommerce.AbmRol.frmRol_Agregar();
            frm.MdiParent = this;
            frm.Show();
        }

        private void modificarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbmRol.frmRol_SeleccionEditar frm = new FrbaCommerce.AbmRol.frmRol_SeleccionEditar();
            frm.MdiParent = this;
            frm.Show();
        }

        private void bajaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbmRol.frmRol_SeleccionEliminar frm = new FrbaCommerce.AbmRol.frmRol_SeleccionEliminar();
            frm.MdiParent = this;
            frm.Show();
        }

        private void listadoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbmRol.frmRol_Listado frm = new FrbaCommerce.AbmRol.frmRol_Listado();
            frm.MdiParent = this;
            frm.Show();
        }

        private void altaToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmCliente_Alta frm = new frmCliente_Alta();
            frm.MdiParent = this;
            frm.Show();
        }

        private void modificarToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmCliente_SeleccionarEditar frm = new frmCliente_SeleccionarEditar();
            frm.MdiParent = this;
            frm.Show();
        }
    }
}
