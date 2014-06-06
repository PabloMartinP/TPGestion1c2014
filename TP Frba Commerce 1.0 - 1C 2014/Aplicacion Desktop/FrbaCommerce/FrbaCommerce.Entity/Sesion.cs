using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Entity
{
    public static class Sesion
    {
        /// <summary>
        /// esta variable se settea cuando el usuario loguea bien
        /// </summary>
        public static Usuario Usuario { get; set; }
    }
}
