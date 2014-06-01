using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Documento
    {
        public int Tipo { get; set; }
        public double Numero { get; set; }

        public Documento()
        { 

        }
        
        public Documento(int tipo, double numero)
        {
            this.Tipo = tipo;
            this.Numero = numero;
        }
    }
}
