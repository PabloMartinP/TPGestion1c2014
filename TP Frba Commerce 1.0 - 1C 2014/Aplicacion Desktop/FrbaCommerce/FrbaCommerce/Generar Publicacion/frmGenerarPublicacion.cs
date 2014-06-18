using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;
using FrbaCommerce.Controller;

namespace FrbaCommerce.Generar_Publicacion
{
    public partial class frmGenerarPublicacion : Form
    {
        public frmGenerarPublicacion()
        {
            InitializeComponent();
        }

        private void frmGenerarPublicacion_Load(object sender, EventArgs e)
        {
            ucPublicacion1.Inicializar();
        }

        private void btnGenerar_Click(object sender, EventArgs e)
        {
            try
            {
                string msj = string.Empty;
                if (validar(out msj))
                {
                    try
                    {
                        Publicacion p = ucPublicacion1.getPublicacion();

                        PublicacionController pc = new PublicacionController();
                        ConexionController.BeginTransaction();
                        pc.Generar(p);
                        ConexionController.CommitTransaction();
                        MessageBox.Show("Agregado");
                        this.Close();
                    }
                    catch (Exception ex)
                    {
                        ConexionController.RollbackTransaction();
                        MessageBox.Show(ex.Message);
                    }
                }
                else
                    MessageBox.Show(msj);
            }
            catch (Exception ex1)
            {
                MessageBox.Show(ex1.Message);
            }
        }

        private bool validar(out string msj)
        {
            msj = string.Empty;
            ucPublicacion1.Validar(out msj);            
            return msj == string.Empty;
        }
    }
}
