using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Cliente:Persona
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int TipoDoc { get; set; }
        public string Doc { get; set; }
        
        public DateTime FechaNac { get; set; }
        public string CUIL { get; set; }

    }
}
