using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace FrbaCommerce.Entity
{
    public class Funcionalidad
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public bool Permitida { get; set; }


        public Funcionalidad()
        { }
        public Funcionalidad(string unNombre)
        {
            Nombre = unNombre;
        }
        public Funcionalidad(int unID, string unNombre, bool Permitido)
        {
            ID = unID;
            Nombre = unNombre;
            Permitida=Permitido;
        }
        
    }

}
