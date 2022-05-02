using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinalWeb
{
    public partial class fmrAdministracion : System.Web.UI.Page
    {
        //Conexion
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-2ECAU7F;Initial Catalog=ProyFinal;Integrated Security=True");

        //Comandos
        SqlCommand cmdCargarCmb = new SqlCommand();

        //Adaptadores
        SqlDataAdapter adaptador = new SqlDataAdapter();

        //DataTables
        DataTable dtProductos = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Defino el comando para eliminar el idioma
                cmdCargarCmb.CommandType = System.Data.CommandType.Text;
                cmdCargarCmb.CommandText = "Select idProducto, NombreProducto from Productos";
                cmdCargarCmb.Connection = conexion;

                adaptador.SelectCommand = cmdCargarCmb;
                adaptador.Fill(dtProductos);

                CmbProductos.DataSource = dtProductos;
                CmbProductos.DataTextField = "NombreProducto";
                CmbProductos.DataValueField = "idProducto";
                CmbProductos.DataBind();
            }
        }
    }
}