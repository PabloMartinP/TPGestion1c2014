using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaCommerce.Login
{
    public partial class frmLogin : Form
    {
        public bool Login { get; set; }

        public frmLogin()
        {
            InitializeComponent();

            Login = false;
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            AbrirMDI();
        }

        private void AbrirMDI()
        {
            //cierro esto y que vuelva al program.cs
            Login = true;
            this.Close();
        }
    }
}
