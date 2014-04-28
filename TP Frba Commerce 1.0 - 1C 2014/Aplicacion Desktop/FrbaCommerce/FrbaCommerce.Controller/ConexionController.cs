using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class ConexionController
    {
        private ConexionController()
        { 

        }

        public static void BeginTransaction()
        {

            _transaccion = Conexion.BeginTransaction();
        }

        public static void CommitTransaction()
        {
            _transaccion.Commit();

            LimpiarConexion();
        }
        private static void LimpiarConexion()
        {
            _transaccion = null;
            _conexion.Close();
            _conexion.Dispose();
            _conexion = null;
        }

        public static void RollbackTransaction()
        {
            _transaccion.Rollback();

            LimpiarConexion();
            
        }

        #region Propiedades
        private static SqlConnection _conexion = null;
        private static SqlTransaction _transaccion = null;

        public static SqlTransaction Transaccion
        {
            get { return _transaccion; }
            set { _transaccion = value; }
        }

        public static SqlConnection Conexion
        {
            get 
            {
                if (_conexion == null)
                {
                    _conexion = new SqlConnection(Config.ConnectionString);
                    _conexion.Open();
                }
                return _conexion;
            }
        }

        #endregion


        public static SqlCommand SqlCommand_Inicializar(string sp)
        {
            SqlCommand command = Conexion.CreateCommand();

            command.Connection = _conexion;            
            command.Transaction = _transaccion;

            /*
            if(esTransaccional)
                command.Transaction = _transaccion;
            else
                command.Transaction = null;
            */

            command.CommandType = System.Data.CommandType.StoredProcedure;
            //command.CommandText = "I_A_C." + sp;
            command.CommandText = sp;


            //if (_connection.State == System.Data.ConnectionState.Broken || _connection.State == System.Data.ConnectionState.Closed)

            return command;
        }
        

    }
}
