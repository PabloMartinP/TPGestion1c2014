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
    public partial class ucDocumento : UserControl
    {
        public ucDocumento()
        {
            InitializeComponent();
        }


        public Documento getDocumento()
        {
            try
            {
                Documento doc = new Documento();
                doc.Tipo = (int)cmbTipoDoc.SelectedValue;

                if (txtNumero.Text != string.Empty)
                    doc.Numero = double.Parse(txtNumero.Text);
                else
                    doc.Numero = -1;


                return doc;
            }
            catch (Exception)
            {
                return new Documento(-1,-1);
            }
            
        }

        public void Limpiar()
        {
            cmbTipoDoc.SelectedValue = -1;
            txtNumero.Text = string.Empty;
        }

        public void setDocumento(Documento doc)
        {
            if (doc != null)
            {
                cmbTipoDoc.SelectedValue = doc.Tipo;
                txtNumero.Text = doc.Numero.ToString();
            }
            else
            {
                Limpiar();
            }
            
        }

        public void Inicializar()
        {
            DocumentoController dc = new DocumentoController();

            cmbTipoDoc.DataSource = dc.ObtenerTiposDocumento();

            cmbTipoDoc.DisplayMember = "descripcion";
            cmbTipoDoc.ValueMember = "codigo";

        }



    }
}
