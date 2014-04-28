using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaCommerce.Entity;
using System.Data;

namespace FrbaCommerce.Controller
{
    public class FuncionalidadController
    {
        enum eFuncionalidad
        {
            ABMRol = 1,
            ABMCliente,
            ABMProveedor,
            CargaCredito,
            ComprarGiftCard,
            ComprarCupon,
            PedirDevolucion,
            HistorialComprasCupones,
            ArmarCupon,
            RegistroConsumoCupon,
            PublicarCupon,
            FacturacionProveedor,
            ListadoEstadistico
        }
        private List<int> Administrativo()
        {
            List<int> list = new List<int>();
            list.Add(1);
            list.Add(2);
            list.Add(3);
            list.Add(11);
            list.Add(12);
            list.Add(13);
            return list;
        }
        private List<int> Cliente()
        {
            List<int> list = new List<int>();
            list.Add(4);
            list.Add(5);
            list.Add(6);
            list.Add(7);
            list.Add(8);

            return list;
        }
        private List<int> Proveedor()
        {
            List<int> list = new List<int>();
            list.Add(9);
            list.Add(10);

            return list;
        }
        private bool tieneAlguna(List<int> funcs, List<int> IDs)
        {
            for (int i = 0; i < IDs.Count; i++)
            {
                if (funcs.Contains(IDs[i]))
                    return true;
            }
            return false;
        }
        
        public List<Funcionalidad> Listar(int id)
        {

            SqlConexion cnn = new SqlConexion("Funcionalidad_BuscarPorRol");
            cnn.Command.Parameters.Add("@Rol_ID", System.Data.SqlDbType.Int).Value = id;

            Funcionalidad unaF;
            List<Funcionalidad> lasFuncionalidades = new List<Funcionalidad>();
            
            foreach(DataRow dr in cnn.Ejecutar().Rows)
            {
                unaF = new Funcionalidad();

                unaF.ID = (int)dr["fun_ID"];
                unaF.Nombre = dr["fun_nombre"].ToString();
                
                unaF.Permitida = dr["Permitido"].ToString() == "1";
                
                lasFuncionalidades.Add(unaF);
            }
            return lasFuncionalidades;
        }




    }
}
