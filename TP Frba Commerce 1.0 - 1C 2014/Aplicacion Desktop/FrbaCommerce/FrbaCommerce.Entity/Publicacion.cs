using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Publicacion
    {
        public enum eEstado
        { 
            Borrador = 1, 
            Activa = 2, 
            Pausada = 3, 
            Finalizada = 4
        }

        public enum eTipo
        { 
            CompraInmediata = 1 ,
            Subasta = 2
        }

        public int Id { get; set; }
        public string Descripcion { get; set; }
        public int Stock { get; set; }
        public DateTime Fecha { get; set; }
        public DateTime Vencimiento { get; set; }
        public decimal Precio { get; set; }
        public Visibilidad Visibilidad { get; set; }
        public Usuario Usuario { get; set; }
        public eEstado  Estado { get; set; }
        public eTipo Tipo { get; set; }
        public bool Preguntas { get; set; }

        public List<Rubro> Rubros{get;set;}

    }

}
