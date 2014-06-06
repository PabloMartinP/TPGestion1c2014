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

        private Publicacion _publicacion = null;
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

        public void setPublicacion(Publicacion publicacion)
        {
            ucPublicacionTipo1.setTipo(publicacion.Tipo);
            ucPublicacionEstado1.setEstado(publicacion.Estado);
            ucVisibilidad1.setVisibilidad(publicacion.Visibilidad);
            txtDescripcion.Text = publicacion.Descripcion;
            numStock.Value = publicacion.Stock;
            txtPrecio.Text = publicacion.Precio.ToString();
            ucRubros1.setRubros(publicacion.Rubros);
            ucFecha.Fecha = publicacion.Fecha;
            chkPreguntas.Checked = publicacion.Preguntas;

            setEstado(publicacion);

            ucPublicacionTipo1.Enabled = false;

            _publicacion = publicacion;

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
                    
                    ucPublicacionEstado1.Enabled = p.Tipo == Publicacion.eTipo.CompraInmediata;
                    ucPublicacionEstado1.Borrar(Publicacion.eEstado.Borrador);

                    
                    break;
                case Publicacion.eEstado.Pausada:
                    setHabilitar(false);
                    ucPublicacionEstado1.Enabled = true;
                                        
                    //si es compraInmediata lo habilito, sino no
                    //solo puede modificar en forma incremental
                    numStock.Enabled = p.Tipo == Publicacion.eTipo.CompraInmediata;
                    ucPublicacionEstado1.Borrar(Publicacion.eEstado.Borrador);

                    break;
                case Publicacion.eEstado.Finalizada :
                    //pongo todo en solo lectura
                    setHabilitar(false);
                    ucPublicacionEstado1.Borrar(Publicacion.eEstado.Borrador);

                    
                    
                    break;
                default:
                    break;
            }

            ucPublicacionEstado1.setEstado(p.Estado);

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

        public bool Validar(out string mensaje)
        {
            mensaje = string.Empty;

            switch (_publicacion.Tipo)
            {
                case Publicacion.eTipo.CompraInmediata:
                    if (numStock.Value < _publicacion.Stock)
                    {
                        mensaje += "\nEl stock no puede ser menor al actual en una CompraInmediata";
                    }
                    break;
                case Publicacion.eTipo.Subasta:
                    break;
                default:
                    break;
            }

            return mensaje == string.Empty;

        }
    }
}
