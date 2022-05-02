using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoFinalWeb.Clases
{
    public class Producto
    {
        public int idProducto { get; set; }
        public String NombreProducto { get; set; }
        public int CantidadMinima { get; set; }
        public int CantidadTotal { get; set; }
        public int PrecioCompra { get; set; }
        public int Pvp { get; set; }
    }
}