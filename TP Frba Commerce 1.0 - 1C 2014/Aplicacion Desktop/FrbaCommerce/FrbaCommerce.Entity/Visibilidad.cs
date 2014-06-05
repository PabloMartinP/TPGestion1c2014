using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Visibilidad
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Descripcion  { get; set; }
        public decimal Precio { get; set; }
        public decimal Porcentaje { get; set; }
        public int DuracionDias { get; set; }
        public int Prioridad { get; set; }

    }
}
