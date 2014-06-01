using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class DocumentoController
    {

        public Documento BuscarTipo(int codigo)
        {
            SqlConexion sql = new SqlConexion("documento_buscar");

            return _cargarDatos(sql.Ejecutar());
        }

        private Documento _cargarDatos(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                Documento doc = new Documento();
                doc.Tipo = int.Parse(dt.Rows[0].ToString());
                doc.Numero = double.Parse(dt.Rows[1].ToString());

                return doc;
            }
            else
                return null;
        }

        public DataTable ObtenerTiposDocumento()
        {
            SqlConexion sql = new SqlConexion("cliente_tipos_doc");
            return sql.Ejecutar();
        }

    }
}
