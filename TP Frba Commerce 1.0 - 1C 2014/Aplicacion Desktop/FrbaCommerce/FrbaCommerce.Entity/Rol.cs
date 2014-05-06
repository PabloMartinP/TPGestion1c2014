using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Rol
    {

        public int ID { get; set; }
        public string Nombre { get; set; }
        public bool Habilitado { get; set; }
        public List<Funcionalidad> Funcionalidades { get; set; }

        public Rol()
        { }

        public Rol(int ID, string Nombre)
        {
            this.ID = ID;
            this.Nombre = Nombre;
            Habilitado = true;
        }
        public Rol(int ID, string Nombre, bool Habilitado)
        {
            this.ID = ID;
            this.Nombre = Nombre;
            this.Habilitado = Habilitado;
        }

    }
}
