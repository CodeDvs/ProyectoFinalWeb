using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace ProyectoFinalWeb.Controladores
{
    /// <summary>
    /// Descripción breve de CargarDatos
    /// </summary>
    public class CargarDatos : IHttpHandler
    {
        //Conexion
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-2ECAU7F;Initial Catalog=ProyFinal;Integrated Security=True");

        //Comandos
        SqlCommand cmdCargarDatos = new SqlCommand();

        //Parametros
        SqlParameter prmId = new SqlParameter();

        //DataReader
        SqlDataReader reader;

        //List
        List<Clases.Producto> ListaProductos = new List<Clases.Producto>();
        public void ProcessRequest(HttpContext context)
        {
            //Defino el comando para eliminar el idioma
            cmdCargarDatos.CommandType = System.Data.CommandType.Text;
            cmdCargarDatos.CommandText = "Select idProducto," +
                " NombreProducto as Nombre," +
                "CantidadMinima as Cmin," +
                "CantidadTotal as Ctotal," +
                "(Select CosteProducto from CosteProducto where CosteProducto.idProducto = Productos.idProducto) as Coste," +
                "(Select Pvp from CosteProducto where CosteProducto.idProducto = Productos.idProducto) as pvp" +
                " from Productos where idProducto=@p_id";
            cmdCargarDatos.Connection = conexion;

            //Parametro para darle valor al codigo
            prmId.ParameterName = "@p_id";
            prmId.SqlDbType = SqlDbType.Int;
            prmId.Direction = ParameterDirection.Input;

            cmdCargarDatos.Parameters.Add(prmId);

            cmdCargarDatos.Parameters[0].Value = context.Request.Params["clave"];

            conexion.Open();
            reader = cmdCargarDatos.ExecuteReader();

            while (reader.Read())
            {
                Clases.Producto producto = new Clases.Producto();

                producto.idProducto = int.Parse(reader[0].ToString());
                producto.NombreProducto = reader[1].ToString();
                producto.CantidadMinima = int.Parse(reader[2].ToString());
                producto.CantidadTotal = int.Parse(reader[3].ToString());
                producto.PrecioCompra = int.Parse(reader[4].ToString());
                producto.Pvp = int.Parse(reader[5].ToString());

                ListaProductos.Add(producto);

            }

            JavaScriptSerializer Serializador = new JavaScriptSerializer();
            context.Response.Write(Serializador.Serialize(ListaProductos));
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