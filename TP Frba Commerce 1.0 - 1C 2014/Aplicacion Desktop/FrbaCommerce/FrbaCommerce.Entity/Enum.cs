using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Enum
    {
        public enum eTipoAccion
        { 
            Alta  = 1, 
            Modificacion = 2, 
            Baja = 3
        }
        public enum eTipoHistorialCliente
        {
            Compras = 1,
            Ofertas = 2,
            Calificaciones = 3
        }
    }
}
