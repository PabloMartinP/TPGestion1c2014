using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCommerce.Entity
{
    public class Usuario
    {
        public enum eTipo
        { 
            
            Empresa=1, 
            Administrador = 2,
            Cliente=3, 
        }

        public int ID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool Habilitado { get; set; }
        public bool PrimeraVez { get; set; }
        public eTipo Tipo { get; set; }
        public Rol Rol { get; set; }

        public static string EncriptarSHA256(string texto)
        {
            return GetSHA256Encriptado(texto);
            //return texto;
        }


        private static string GetSHA256Encriptado(string password)
        {
            System.Security.Cryptography.SHA256 sha256 = new System.Security.Cryptography.SHA256Managed();
            byte[] sha256Bytes = System.Text.Encoding.Default.GetBytes(password);
            byte[] cryString = sha256.ComputeHash(sha256Bytes);
            string resultEncriptado = string.Empty;
            for (int i = 0; i < cryString.Length; i++)
            {
                resultEncriptado += cryString[i].ToString("X");
            }

            return resultEncriptado;
        }

    }
}
