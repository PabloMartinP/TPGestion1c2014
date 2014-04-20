using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Controller;

namespace FrbaCommerce
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                TestController tc = new TestController();

                ConexionController.BeginTransaction();
                
                tc.insert_t1();
                tc.insert_t2();

                ConexionController.CommitTransaction();
            }
            catch (Exception ex)
            {                
                ConexionController.RollbackTransaction();
                MessageBox.Show(ex.Message);
            }
        }
    }
}
