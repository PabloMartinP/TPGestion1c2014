using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace FrbaCommerce
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            Login.frmLogin login = new Login.frmLogin();

            login.ShowDialog();


            //si logueo OK abro el mdi
            if (login.Login)
                Application.Run(new frmMDI());
        }
    }
}
