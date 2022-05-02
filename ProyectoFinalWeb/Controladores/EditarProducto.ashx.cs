using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoFinalWeb.Controladores
{
    /// <summary>
    /// Descripción breve de EditarProducto
    /// </summary>
    public class EditarProducto : IHttpHandler
    {
        //Conexion
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-2ECAU7F;Initial Catalog=ProyFinal;Integrated Security=True");
        public void ProcessRequest(HttpContext context)
        {
            //Comandos
            SqlCommand cmdEditar = new SqlCommand();

            //Parametros
            SqlParameter prmId = new SqlParameter();
            SqlParameter prmNombre = new SqlParameter();
            SqlParameter prmCantidadMin = new SqlParameter();
            SqlParameter prmCantidad = new SqlParameter();
            SqlParameter prmPrecioCoste = new SqlParameter();
            SqlParameter prmPvp = new SqlParameter();
            SqlParameter prmSalida = new SqlParameter();

            //Defino el comando para dar de alta un nuevo producto
            cmdEditar.CommandType = System.Data.CommandType.StoredProcedure;
            cmdEditar.CommandText = "pr_EditarProductos";
            cmdEditar.Connection = conexion;

            //Parametro para darle valor al codigo
            prmId.ParameterName = "@p_Id";
            prmId.SqlDbType = SqlDbType.Int;
            prmId.Direction = ParameterDirection.Input;

            prmNombre.ParameterName = "@p_Nombre";
            prmNombre.SqlDbType = SqlDbType.VarChar;
            prmNombre.Size = 25;
            prmNombre.Direction = ParameterDirection.Input;


            prmCantidadMin.ParameterName = "@p_CantidadMin";
            prmCantidadMin.SqlDbType = SqlDbType.SmallInt;
            prmCantidadMin.Direction = ParameterDirection.Input;


            prmCantidad.ParameterName = "@p_Cantidad";
            prmCantidad.SqlDbType = SqlDbType.SmallInt;
            prmCantidad.Direction = ParameterDirection.Input;


            prmPrecioCoste.ParameterName = "@p_PrecioCoste";
            prmPrecioCoste.SqlDbType = SqlDbType.Money;
            prmPrecioCoste.Direction = ParameterDirection.Input;

            prmPvp.ParameterName = "@p_Pvp";
            prmPvp.SqlDbType = SqlDbType.Money;
            prmPvp.Direction = ParameterDirection.Input;

            prmSalida.ParameterName = "@p_Salida";
            prmSalida.SqlDbType = SqlDbType.SmallInt;
            prmSalida.Direction = ParameterDirection.Output;

            //Añado los parametros al comando
            cmdEditar.Parameters.Add(prmId);
            cmdEditar.Parameters.Add(prmNombre);
            cmdEditar.Parameters.Add(prmCantidadMin);
            cmdEditar.Parameters.Add(prmCantidad);
            cmdEditar.Parameters.Add(prmPrecioCoste);
            cmdEditar.Parameters.Add(prmPvp);
            cmdEditar.Parameters.Add(prmSalida);

            //Abro la conexion
            conexion.Open();

            //Le doy valor a los parametros
            cmdEditar.Parameters[0].Value = context.Request.Params["id"];
            cmdEditar.Parameters[1].Value = context.Request.Params["nombre"];
            cmdEditar.Parameters[2].Value = context.Request.Params["cantMin"];
            cmdEditar.Parameters[3].Value = context.Request.Params["cant"];
            cmdEditar.Parameters[4].Value = context.Request.Params["precioCompra"];
            cmdEditar.Parameters[5].Value = context.Request.Params["pvp"];

            try
            {
                //Ejecuto el comando
                cmdEditar.ExecuteNonQuery();
                context.Response.Write(cmdEditar.Parameters[6].Value);
            }
            catch
            {
                context.Response.Write(-1);
            }
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