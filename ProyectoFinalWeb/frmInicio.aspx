<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmInicio.aspx.cs" Inherits="ProyectoFinalWeb.frmInicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Productos</title>
    <link rel="stylesheet"  href="css/jquery.dataTables.min.css"/>
    <script type="text/javascript" charset="utf8" src="Jquery/Jquery3.6.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.min.js"></script>
    
    <script>
        function CargarTabla()
        {
            $.ajax({
                url: 'Controladores/CargarTabla.ashx',
                method: 'post',
                dataType: 'json',
                success: function (data)
                {
                    
                    $(data).each(function (index, elem)
                    {
                        dtable.row.add(elem).draw();
                    });
                    
                },
            })
        }
        $(document).ready(function ()
        {
            //Defino el DataTable
            dtable = $('#tProductos').DataTable({ "columns": [{ "data": "NombreProducto" }, { "data": "CantidadMinima" }, { "data": "CantidadTotal" },
                                                              { "data": "PrecioCompra" }, { "data": "Pvp" }]});

            //Cargar tabla
            CargarTabla();

            //Variables
            var id;
    
            $('#btnComprobar').click(function () {
                var valor = $('#txtComprobar').val();
                if (valor == "") {
                    $('#lblResultado').css({ 'color': 'red' });
                    $('#lblResultado').text("¡No puedes dejar este campo vacio!");
                    $('#txtComprobar').css({ 'background-color': 'yellow' });
                    
                }
                else {
                    
                    $.ajax({
                        //Al que llamo
                        url: 'Controladores/ComprobarStock.ashx',
                        //metodo de envio
                        type: 'post',
                        async: true,
                        //Paso los datos
                        data: { clave: valor },

                        success: function (resp) {

                            if (resp == 0) {
                                $('#lblResultado').text("¡No dispones de existencias!");
                                $('#lblResultado').css({ 'color': 'red' });
                            }
                            else if (resp == -1) {
                                $('#lblResultado').text("¡No se encontro el articulo buscado, por favor, revise que el nombre este bien escrito!");
                            }
                            else { $('#lblResultado').text("las existencias de este producto son: " + resp + " unidades."); }
                        }

                    });
                }
                
            $('#txtComprobar').click(function ()
            {
                $('#txtComprobar').css({ 'background-color': 'white' });
                $('#txtComprobar').val("");
                $('#lblResultado').text("");
            });
            $('#txtEliminar').click(function ()
            {
                $('#txtEliminar').css({ 'background-color': 'white' });
                $('#lblEliminar').text("");
            });
            $('#btnMAceptar').click(function ()
            {
                //Valor de las variables
                var Eliminar = $('#txtEliminar').val();
                if (Eliminar == "")
                {
                    $('#Modal').hide();
                    $('#txtEliminar').css({ 'background-color': 'Yellow' });
                    $('#lblEliminar').text("No puedes dejar este campo vacío");
                    $('#lblEliminar').css({ 'color': 'red' });
                }
                else
                {
                    id = $('#txtEliminar').val();
                    $.ajax({
                        //Al que llamo
                        url: 'Controladores/EliminarProducto.ashx',
                        //metodo de envio
                        type: 'post',
                        async: true,
                        //Paso los datos
                        data: { clave: id },

                        success: function (resp) {

                            if (resp == 0) {
                                //Muestro el mensaje
                                $('#lblEliminar').text("¡Producto eliminado correctamente!");
                                $('#lblEliminar').css({ 'color': 'green' });

                                //Limpio la tabla
                                dtable.clear();

                                //Cargo la tabla
                                CargarTabla();

                                //Vacio el textbox
                                $('#txtEliminar').val("");
                            }
                            else if (resp == -1) {
                                //Muestro el mensaje
                                $('#lblEliminar').text("¡No se pudo eliminar el producto, por favor, comprueba que este bien escrito!");
                                $('#lblEliminar').css({ 'color': 'red' });
                            }
                        }

                    });
                }
            });
        });
    </script>
</head>
<body id="body" style="background-color: grey">
    <form id="form1" runat="server">
        <!--Script manager con la referencia a bootstrap -->
        <asp:ScriptManager runat="server" ID="smBootstrap">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/bootstrap.min.js" />
            </Scripts>
        </asp:ScriptManager>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <a class="navbar-brand" href="#">MENU</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="Stock" href="frminicio.aspx">Productos</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="frmAdministracion.aspx">Administracion</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div style="text-align: center; background-color:aqua">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="PRODUCTOS"/>        
        </div>
        <br/>
        <div>
            <fieldset id="fieldd"style="margin:auto;border-style:solid;border-width:4px;border-color:black;background-color:aquamarine">
                <br/>
            <table id="tProductos" class="display" style="background-color:aquamarine">
            <thead>
                <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Cantidad Minima</th>
                    <th scope="col">Cantidad Actual</th>
                    <th scope="col">Precio Coste</th>
                    <th scope="col">P.V.P</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
                </fieldset>
            <br />            
        </div>
        <br/>
        <fieldset id="field"style="border-style:solid;border-width:4px;border-color:black;background-color:aquamarine;max-width:600px">
            <br/>
            <legend style="text-align:center">Herramientas</legend>
            <br/>
            <br/>
        <div style="margin-left: 50px">
            <asp:Label ID="lblDisponibilidad" runat="server" Text="Comprobar disponibilidad:"/>
            <br/>
            <br/>
            <asp:TextBox ID="txtComprobar" runat="server" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode==209) || (event.charCode==241)"/> <input type="button" id="btnComprobar" style="margin-left:20px" value="Comprobar" />
            <br/>
            <asp:Label ID="lblResultado" runat="server" Text=""/> 
            <br/>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="Productos a eliminar:"/>
            <br/>
            <br/>
            <asp:TextBox ID="txtEliminar" runat="server" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode==209) || (event.charCode==241)"/><input type="button" id="btnEliminar" style="margin-left:20px" value="Eliminar" data-bs-toggle="modal" data-bs-target="#Modal" />
            <br/>
            <br/>
            <asp:Label ID="lblEliminar" runat="server" Text=""/>   
            <br/>
        </div>
        </fieldset>
         <!--Modal-->
        <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="ModalEliminar" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#Modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel">Confirmación</h5>
                <button type="button" id="btnX" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                ¿Deseas eliminar este producto?
              </div>
              <div class="modal-footer">
                <button type="button" id="btnMcancelar" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                  <button type="button" id="btnMAceptar" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
              </div>
            </div>
          </div>
        </div>
        <br/>
        <br/>
    </form>
</body>
    
</html>
