using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Permiso
    {
        public Rol Rol;
        public Funcionalidad Funcionalidad;

        public Permiso()
        {
        }
        public Permiso(Rol unRol, Funcionalidad unaFuncionalidad)
        {
            this.Rol = unRol;
            this.Funcionalidad = unaFuncionalidad;
        }
    }
}
