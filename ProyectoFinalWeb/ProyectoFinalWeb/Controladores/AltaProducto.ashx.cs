using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoFinalWeb.Controladores
{
    /// <summary>
    /// Descripción breve de AltaProducto
    /// </summary>
    public class AltaProducto : IHttpHandler
    {
        //Conexion
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-2ECAU7F;Initial Catalog=ProyFinal;Integrated Security=True");
        public void ProcessRequest(HttpContext context)
        {
            //Comandos
            SqlCommand cmdAlta = new SqlCommand();
            SqlCommand cmdMax = new SqlCommand();

            //Parametros
            SqlParameter prmId = new SqlParameter();
            SqlParameter prmNombre = new SqlParameter();
            SqlParameter prmCantidadMin = new SqlParameter();
            SqlParameter prmCantidad = new SqlParameter();
            SqlParameter prmPrecioCoste = new SqlParameter();
            SqlParameter prmPvp = new SqlParameter();
            SqlParameter prmSalida = new SqlParameter();

            //Variables
            int ID;


            //Defino el comando para dar de alta un nuevo producto
            cmdAlta.CommandType = System.Data.CommandType.StoredProcedure;
            cmdAlta.CommandText = "pr_AltasProductos";
            cmdAlta.Connection = conexion;

            cmdMax.CommandType = System.Data.CommandType.Text;
            cmdMax.CommandText = "Select max(idProducto) from productos";
            cmdMax.Connection = conexion;

            //Parametro para darle valor al codigo
            prmId.ParameterName = "@p_Id";
            prmId.SqlDbType = SqlDbType.Char;
            prmId.Size = 5;
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
            cmdAlta.Parameters.Add(prmId);
            cmdAlta.Parameters.Add(prmNombre);
            cmdAlta.Parameters.Add(prmCantidadMin);
            cmdAlta.Parameters.Add(prmCantidad);
            cmdAlta.Parameters.Add(prmPrecioCoste);
            cmdAlta.Parameters.Add(prmPvp);
            cmdAlta.Parameters.Add(prmSalida);

            //Abro la conexion
            conexion.Open();

            ID=int.Parse(cmdMax.ExecuteScalar().ToString())+1;

            //Le doy valor a los parametros
            cmdAlta.Parameters[0].Value = ID;
            cmdAlta.Parameters[1].Value = context.Request.Params["nombre"];
            cmdAlta.Parameters[2].Value = context.Request.Params["cantMin"];
            cmdAlta.Parameters[3].Value = context.Request.Params["cant"];
            cmdAlta.Parameters[4].Value = context.Request.Params["precioCompra"];
            cmdAlta.Parameters[5].Value = context.Request.Params["pvp"];

            //Ejecuto el comando
            cmdAlta.ExecuteNonQuery();
            context.Response.Write(cmdAlta.Parameters[6].Value);
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