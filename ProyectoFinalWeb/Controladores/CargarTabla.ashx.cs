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
    /// Descripción breve de CargarTabla
    /// </summary>
    public class CargarTabla : IHttpHandler
    {
        //Conexion
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-2ECAU7F;Initial Catalog=ProyFinal;Integrated Security=True");

        //Comandos
        SqlCommand cmdCargar = new SqlCommand();

        //Adaptadores
        SqlDataAdapter adaptador = new SqlDataAdapter();

        //DataReader
        SqlDataReader reader;

        //List
        List<Clases.Producto> ListaProductos = new List<Clases.Producto>();

        //Objetos
        
        public void ProcessRequest(HttpContext context)
        {
            
            //Defino el comando para eliminar el idioma
            cmdCargar.CommandType = System.Data.CommandType.Text;
            cmdCargar.CommandText = "Select NombreProducto as Nombre," +
                "CantidadMinima as Cmin," +
                "CantidadTotal as Ctotal," +
                "(Select CosteProducto from CosteProducto where CosteProducto.idProducto = Productos.idProducto) as Coste," +
                "(Select Pvp from CosteProducto where CosteProducto.idProducto = Productos.idProducto) as pvp" +
                " from Productos";
            cmdCargar.Connection = conexion;



            conexion.Open();
            reader = cmdCargar.ExecuteReader();

            while (reader.Read())
            {
                Clases.Producto producto = new Clases.Producto();

                producto.NombreProducto = reader[0].ToString();
                producto.CantidadMinima = int.Parse(reader[1].ToString()); 
                producto.CantidadTotal = int.Parse(reader[2].ToString());
                producto.PrecioCompra = int.Parse(reader[3].ToString());
                producto.Pvp = int.Parse(reader[4].ToString());

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