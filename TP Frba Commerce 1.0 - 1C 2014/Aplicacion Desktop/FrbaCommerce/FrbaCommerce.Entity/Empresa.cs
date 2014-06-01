using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Empresa:Persona
    {
        public string RazonSocial { get; set; }
        public string Ciudad { get; set; }
        public string CUIT { get; set; }
        public string Contacto { get; set; }
        public DateTime FechaCreacion { get; set; }        
        public int Puntuacion { get; set; }
    }
}
