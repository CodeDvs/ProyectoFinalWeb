using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoFinalWeb.Controladores
{
    /// <summary>
    /// Descripción breve de EliminarProducto
    /// </summary>
    public class EliminarProducto : IHttpHandler
    {
        //Conexion
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-2ECAU7F;Initial Catalog=ProyFinal;Integrated Security=True");

        //Comandos
        SqlCommand cmdEliminar = new SqlCommand();

        //Parametros
        SqlParameter prmNombre = new SqlParameter();
        public void ProcessRequest(HttpContext context)
        {
            //Defino el comando para dar de alta un nuevo producto
            cmdEliminar.CommandType = System.Data.CommandType.StoredProcedure;
            cmdEliminar.CommandText = "pr_EliminarProductos";
            cmdEliminar.Connection = conexion;

            //Parametro para darle valor al codigo
            prmNombre.ParameterName = "@p_Nombre";
            prmNombre.SqlDbType = SqlDbType.VarChar;
            prmNombre.Size = 25;
            prmNombre.Direction = ParameterDirection.Input;


            //Añado los parametros al comando
            cmdEliminar.Parameters.Add(prmNombre);


            //Abro la conexion
            conexion.Open();

            //Le doy valor a los parametros
            cmdEliminar.Parameters[0].Value = context.Request.Params["clave"];

            //Ejecuto el comando
            //try
            //{
                cmdEliminar.ExecuteNonQuery();
                context.Response.Write(0);
            //}
            //catch
            //{
            //    context.Response.Write(-1);
            //}
            
            //Cierro la conexion
            conexion.Close();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}