using EllipticCurve.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoFinalWeb.Controladores
{
    /// <summary>
    /// Descripción breve de ComprobarStock
    /// </summary>
    public class ComprobarStock : IHttpHandler
    {
        //Conexion
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-2ECAU7F;Initial Catalog=ProyFinal;Integrated Security=True");

        public void ProcessRequest(HttpContext context)
        {
            //Comandos
            SqlCommand cmd = new SqlCommand();

            //Parametros
            SqlParameter prmProducto = new SqlParameter();
            SqlParameter prmSalida = new SqlParameter();

            //Defino el comando para la comprobacion del producto
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "pr_ComprobarExistencias";
            cmd.Connection = conexion;

            //Parametro para darle valor al codigo
            prmProducto.ParameterName = "@p_NombreProducto";
            prmProducto.SqlDbType = SqlDbType.VarChar;
            prmProducto.Size = 25;
            prmProducto.Direction = ParameterDirection.Input;

            prmSalida.ParameterName = "@p_Salida";
            prmSalida.SqlDbType = SqlDbType.SmallInt;
            prmSalida.Direction = ParameterDirection.Output;

            cmd.Parameters.Add(prmProducto);
            cmd.Parameters.Add(prmSalida);
            conexion.Open();
            cmd.Parameters[0].Value = context.Request.Params["clave"];
            cmd.ExecuteNonQuery();
            context.Response.Write(cmd.Parameters[1].Value);
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