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

namespace FrbaCommerce.Editar_Publicacion
{
    public partial class frmEditarPublicacion : Form
    {

        private Publicacion _publicacion = null;
        public frmEditarPublicacion(Publicacion publicacion)
        {
            InitializeComponent();

            _publicacion = publicacion;
        }

        

        private void btnGuardar_Click(object sender, EventArgs e)
        {

            string mensaje = string.Empty;
            if (ucPublicacion1.Validar(out mensaje))
            {
                Publicacion p = ucPublicacion1.getPublicacion();
                //uso el Id de la publcacion que paso como parametro
                p.Id = _publicacion.Id;
                PublicacionController pc = new PublicacionController();
                try
                {
                    ConexionController.BeginTransaction();
                    pc.Editar(p);
                    ConexionController.CommitTransaction();
                    MessageBox.Show("guardado");

                    //vuelvo a cargar la publicacion;
                    _publicacion = pc.Buscar(p.Id);
                    ucPublicacion1.Inicializar();
                    ucPublicacion1.setPublicacion(_publicacion);
                    
                }
                catch (Exception ex)
                {
                    ConexionController.RollbackTransaction();
                    MessageBox.Show(ex.Message);
                }
            }
            else
                MessageBox.Show(mensaje);
            


        }

        private void frmEditarPublicacion_Load(object sender, EventArgs e)
        {

            ucPublicacion1.Inicializar();
            ucPublicacion1.setPublicacion(_publicacion);


        }

    }
}
