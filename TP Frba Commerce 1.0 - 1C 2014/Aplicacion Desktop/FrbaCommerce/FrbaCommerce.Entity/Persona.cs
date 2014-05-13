using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Persona
    {
        public Usuario Usuario { get; set; }
        public string Mail { get; set; }
        public string Telefono { get; set; }
        public string Calle { get; set; }
        public int Numero { get; set; }
        public int Piso { get; set; }
        public string Depto { get; set; }
        public string Localidad { get; set; }
        public string CodPostal { get; set; }


        public int Puntuacion { get; set; }
    }
}
