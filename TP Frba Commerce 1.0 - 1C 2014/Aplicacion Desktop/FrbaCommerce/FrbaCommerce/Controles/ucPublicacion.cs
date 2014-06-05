using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controles
{
    public partial class ucPublicacion : UserControl
    {
        public ucPublicacion()
        {
            InitializeComponent();
        }
        public void Inicializar()
        {
            ucRubros1.Inicializar();
            ucVisibilidad1.Inicializar();

            ucPublicacionEstado1.Inicializar();

            ucPublicacionTipo1.Inicializar();
        }


        public Publicacion getPublicacion()
        {
            Publicacion p = new Publicacion();

            p.Descripcion = txtDescripcion.Text;
            p.Stock = int.Parse(numStock.Value.ToString());
            p.Fecha = ucFecha.Fecha;
            
            p.Precio = decimal.Parse(txtPrecio.Text);
            
            p.Visibilidad = ucVisibilidad1.getVisibilidad();

            p.Vencimiento = p.Fecha.AddDays(p.Visibilidad.DuracionDias);
            p.Usuario = Sesion.Usuario;
            p.Estado = ucPublicacionEstado1.getEstado();
            p.Tipo = ucPublicacionTipo1.getTipo();
            p.Preguntas = chkPreguntas.Checked;


            p.Rubros = ucRubros1.getRubros();

            return p;
        }

        public void setPublicacion(Publicacion _publicacion)
        {
            ucPublicacionTipo1.setTipo(_publicacion.Tipo);
            ucPublicacionEstado1.setEstado(_publicacion.Estado);
            ucVisibilidad1.setVisibilidad(_publicacion.Visibilidad);
            txtDescripcion.Text = _publicacion.Descripcion;
            numStock.Value = _publicacion.Stock;
            txtPrecio.Text = _publicacion.Precio.ToString();
            ucRubros1.setRubros(_publicacion.Rubros);
            ucFecha.Fecha = _publicacion.Fecha;
            chkPreguntas.Checked = _publicacion.Preguntas;

            setEstado(_publicacion);

        }
        public void setEstado(Publicacion p)
        {
            switch (p.Estado)
            {
                case Publicacion.eEstado.Borrador:
                    setHabilitar(true);

                    break;
                case Publicacion.eEstado.Activa:
                    setHabilitar(false);
                    ucPublicacionTipo1.Enabled = p.Tipo == Publicacion.eTipo.CompraInmediata;
                    
                    break;
                case Publicacion.eEstado.Pausada:
                    setHabilitar(false);
                    ucPublicacionTipo1.Enabled = true;

                    
                    //si es compraInmediata lo habilito, sino no
                    //solo puede modificar en forma incremental
                    numStock.Enabled = p.Tipo == Publicacion.eTipo.CompraInmediata;

                    break;
                case Publicacion.eEstado.Finalizada :
                    //pongo todo en solo lectura
                    setHabilitar(false);
                    
                    break;
                default:
                    break;
            }
        }
        public void setHabilitar(bool hablitar)
        {
            ucPublicacionTipo1.Enabled = hablitar;
            ucPublicacionEstado1.Enabled = hablitar;
            ucVisibilidad1.Enabled = hablitar;
            txtDescripcion.Enabled = hablitar;
            numStock.Enabled = hablitar;
            txtPrecio.Enabled = hablitar;
            ucRubros1.Enabled = hablitar;
            ucFecha.Enabled = hablitar;
            chkPreguntas.Enabled = hablitar;

        }
    }
}
