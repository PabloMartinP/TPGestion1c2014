using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Factura
    {
        

        public Cabecera Cabecera { get; set; }
        public List<Detalle> Items { get; set; }
        
    }

    public class Cabecera
    {
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public int Usuario { get; set; }
        public FrbaCommerce.Entity.Enum.eTipoPago TipoPago { get; set; }
        public decimal Total { get; set; }        
    }

    public class Detalle
    {
        public int Comp_Id { get; set; }
        public int Renglon { get; set; }
        public int Publicacion { get; set; }
        public int Cantidad { get; set; }
        public decimal Monto { get; set; }
    }
}
