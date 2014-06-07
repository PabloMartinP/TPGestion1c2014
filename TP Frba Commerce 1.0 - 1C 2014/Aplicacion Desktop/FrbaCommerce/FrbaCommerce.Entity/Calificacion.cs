using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Calificacion
    {
        public int Id;
        public int Estrellas { get; set; }
        public string Descripcion { get; set; }
        public Publicacion Publicacion { get; set; }

        public int Compra_Oferta_Id { get; set; }
        
    }
}
