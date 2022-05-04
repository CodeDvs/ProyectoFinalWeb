<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdministracion.aspx.cs" Inherits="ProyectoFinalWeb.fmrAdministracion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Jquery/jquery.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function ()
        {

           
            //Variables
            var opc;
            var id;

            $('#CmbProductos').hide();
            //Oculto todos los controles
            $('#txtNombre').attr('disabled', true);
            $('#txtCantidadMinima').attr('disabled', true);;
            $('#txtCantidad').attr('disabled', true);
            $('#txtPrecioCompra').attr('disabled', true);
            $('#txtPvp').attr('disabled', true);
            $('#CmbProductos').attr('disabled', true);
            $('#btnGuardar').attr('disabled', true);
            $('#btnCancelar').attr('disabled', true);
            $('#btnEliminar').attr('disabled', true);

            //Le añado un valor al cbo
            $('#CmbProductos').prepend('<option value=-1 selected disabled>-Selecciona un producto-</option>');

            //Funcionalidad del boton de alta
            $('#btnAlta').click(function ()
            {
                opc = 1;

                //Desactivo los controles necesarios
                $('#txtNombre').attr('disabled', false);
                $('#txtCantidadMinima').attr('disabled', false);
                $('#txtCantidad').attr('disabled', false);
                $('#txtPrecioCompra').attr('disabled', false);
                $('#txtPvp').attr('disabled', false);
                $('#CmbProductos').attr('disabled', false);
                $('#btnGuardar').attr('disabled', false);
                $('#btnCancelar').attr('disabled', false);

                //Muestro los campos necesarios
                $('#txtNombre').show();
                $('#txtCantidadMinima').show();
                $('#txtCantidad').show();
                $('#txtPrecioCompra').show();
                $('#txtPvp').show();
                $('#CmbProductos').show();
                $('#btnGuardar').show();
                $('#btnCancelar').show();
                $('#lblCantidadMinima').show();
                $('#lblCantidad').show();
                $('#lblNombre').show();
                $('#lblPrecioCompra').show();
                $('#lblPvp').show();
                $('#field').show();
                $('#CmbProductos').hide();

                //Hago focus al control del nombre
                $('#txtNombre').focus();
                //Deshabilito el boton de editar
                $('#btnModificacion').attr('disabled',true);

            });

            //Funcionalidad del boton de modificacion
            $('#btnModificacion').click(function ()
            {
                //Le doy valor a la variable opc
                opc = 2;
                
                //Muestro los campos necesarios
                $('#CmbProductos').show();
                $('#txtNombre').show();
                $('#txtCantidadMinima').show();
                $('#txtCantidad').show();
                $('#txtPrecioCompra').show();
                $('#txtPvp').show();
                $('#btnGuardar').show();
                $('#btnCancelar').show();
                $('#lblCantidadMinima').show();
                $('#lblCantidad').show();

                //Deshabilito el boton de editar
                $('#btnAlta').attr('disabled', true);
                $('#btnCancelar').attr('disabled', false);

                //Habilito el combo
                $('#CmbProductos').attr('disabled', false);

            });

            //Funcionalidad del botno cancelar
            $('#btnCancelar').click(function ()
            {
                //Muestro el mensaje
                $('#lblMensaje').show();

                //Oculto todos los controles
                $('#txtNombre').attr('disabled', true);
                $('#txtCantidadMinima').attr('disabled', true);;
                $('#txtCantidad').attr('disabled', true);
                $('#txtPrecioCompra').attr('disabled', true);
                $('#txtPvp').attr('disabled', true);
                $('#CmbProductos').attr('disabled', true);
                $('#btnGuardar').attr('disabled', true);
                $('#btnCancelar').attr('disabled', true);

                //Habilito el boton de editar
                $('#btnModificacion').attr('disabled', false);
                $('#btnAlta').attr('disabled', false);

                //Vacio valores
                //Nombre
                $('#txtNombre').css({ 'background-color': 'white' });
                $('#txtNombre').val("");
                //Cantidad minima
                $('#txtCantidadMinima').css({ 'background-color': 'white' });
                $('#txtCantidadMinima').val("");
                //Cantidad actual
                $('#txtCantidad').css({ 'background-color': 'white' });
                $('#txtCantidad').val("");
                //Precio compra
                $('#txtPrecioCompra').css({ 'background-color': 'white' });
                $('#txtPrecioCompra').val("");
                //Pvp
                $('#txtPvp').css({ 'background-color': 'white' });
                $('#txtPvp').val("");
                //Resultado
                $('#lblResultado').text("");


                //Le añado un valor al cbo
                $('#CmbProductos').val(-1);


            });

            $('#btnGuardar').click(function ()
            {
                //Valor de las variables
                var Nombre = $('#txtNombre').val();
                var CantMin = $('#txtCantidadMinima').val();
                var Cant = $('#txtCantidad').val();
                var PrecioCompra = $('#txtPrecioCompra').val();
                var Pvp = $('#txtPvp').val();
                var id = $('#CmbProductos').val();

                //Validaciones
                
                if (Nombre == "")
                {
                    $('#lblResultado').css({ 'color': 'red' });
                    $('#lblResultado').text("¡No puedes dejar este campo vacio!");
                    $('#txtNombre').css({ 'background-color': 'yellow' });
                    
                }
                if (CantMin == "")
                {
                    $('#lblResultado').css({ 'color': 'red' });
                    $('#lblResultado').text("¡No puedes dejar este campo vacio!");
                    $('#txtCantidadMinima').css({ 'background-color': 'yellow' });

                }
                if (Cant == "")
                {
                    $('#lblResultado').css({ 'color': 'red' });
                    $('#lblResultado').text("¡No puedes dejar este campo vacio!");
                    $('#txtCantidad').css({ 'background-color': 'yellow' });

                }
                if (PrecioCompra == "")
                {
                    $('#lblResultado').css({ 'color': 'red' });
                    $('#lblResultado').text("¡No puedes dejar este campo vacio!");
                    $('#txtPrecioCompra').css({ 'background-color': 'yellow' });

                }
                if (Pvp == "")
                {
                    $('#lblResultado').css({ 'color': 'red' });
                    $('#lblResultado').text("¡No puedes dejar este campo vacio!");
                    $('#txtPvp').css({ 'background-color': 'yellow' });

                }
                else if (CantMin  Cant)
                {
                    alert(CantMin);
                    alert(Cant);
                    $('#lblResultado').css({ 'color': 'red' });
                    $('#lblResultado').text("¡La cantidad minima debe ser mayor a la actual!");
                    $('#txtCantidadMinima').css({ 'background-color': 'yellow' });
                    $('#txtCantidad').css({ 'background-color': 'yellow' });
                }
                //Opcs de guardar
                else if(opc=1)
                {
                    
                    $.ajax({
                        //Al que llamo
                        url: 'Controladores/AltaProducto.ashx',
                        //metodo de envio
                        type: 'post',
                        async: true,
                        //Paso los datos
                        data: { nombre: Nombre, cantMin: CantMin, cant: Cant, precioCompra: PrecioCompra, pvp:Pvp },

                        success: function (resp) {

                            if (resp == 0) {
                                $('#lblResultado').text("¡Producto añadido con exito!");
                                $('#lblResultado').css({ 'color': 'green' });

                                //Vacio los campos
                                $('#txtNombre').val("");
                                $('#txtCantidadMinima').val("");
                                $('#txtCantidad').val("");
                                $('#txtPrecioCompra').val("");
                                $('#txtPvp').val("");
                            }
                            else if (resp == -1)
                            {
                                $('#lblResultado').text("¡No se pudo añadir el producto!");
                                $('#lblResultado').css({ 'color': 'red' });
                            }
                        }

                    });
                }
                else if (opc = 2) {

                    $.ajax({
                        //Al que llamo
                        url: 'Controladores/EditarProducto.ashx',
                        //metodo de envio
                        type: 'post',
                        async: true,
                        //Paso los datos
                        data: { id: id,nombre: Nombre, cantMin: CantMin, cant: Cant, precioCompra: PrecioCompra, pvp: Pvp },

                        success: function (resp) {

                            if (resp == 0) {
                                $('#lblResultado').text("¡Producto editado con exito!");
                                $('#lblResultado').css({ 'color': 'green' });

                                //Vacio los campos
                                $('#txtNombre').val("");
                                $('#txtCantidadMinima').val("");
                                $('#txtCantidad').val("");
                                $('#txtPrecioCompra').val("");
                                $('#txtPvp').val("");
                            }
                            else if (resp == -1)
                            {
                                $('#lblResultado').text("¡No se pudo editar el producto!");
                                $('#lblResultado').css({ 'color': 'red' });
                            }
                        }

                    });
                }


            });
            //Funcionalidad del boton de modificacion
            $('#CmbProductos').change(function ()
            {
                //Variables
                var valor = $('#CmbProductos').val();

                //Deshabilito los controles
                $('#txtNombre').attr('disabled', false);
                $('#txtCantidadMinima').attr('disabled', false);
                $('#txtCantidad').attr('disabled', false);
                $('#txtPrecioCompra').attr('disabled', false);
                $('#txtPvp').attr('disabled', false);
                $('#CmbProductos').attr('disabled', false);
                $('#btnGuardar').attr('disabled', false);
                $('#txtNombre').focus();
               
                //Funcion Ajax para recuperar los datos
                $.ajax({
                    //Al que llamo
                    url: 'Controladores/CargarDatos.ashx',
                    //metodo de envio
                    type: 'post',
                    async: true,
                    //Paso los datos
                    data: { clave: valor},

                    success: function (datos)
                    {
                        //Deserializo datos
                        var objct = JSON.parse(datos);


                        //Oculto todos los controles
                        $('#txtNombre').attr('disabled', false);
                        $('#txtCantidadMinima').attr('disabled', false);;
                        $('#txtCantidad').attr('disabled', false);
                        $('#txtPrecioCompra').attr('disabled', false);
                        $('#txtPvp').attr('disabled', false);

                        console.log(objct);
                        id = objct[0].idProducto
                        $('#txtNombre').val(objct[0].NombreProducto);
                        $('#txtCantidadMinima').val(objct[0].CantidadMinima);
                        $('#txtCantidad').val(objct[0].CantidadTotal);
                        $('#txtPrecioCompra').val(objct[0].PrecioCompra);
                        $('#txtPvp').val(objct[0].Pvp);
             
                        
                    }

                });

            });
            $('#txtNombre').click(function ()
            {
                $('#txtNombre').css({ 'background-color': 'white' });
                $('#lblResultado').text("");
            });
            $('#txtCantidadMinima').click(function () {
                $('#txtCantidadMinima').css({ 'background-color': 'white' });
                $('#lblResultado').text("");
            });
            $('#txtCantidad').click(function () {
                $('#txtCantidad').css({ 'background-color': 'white' });
                $('#lblResultado').text("");
            });
            $('#txtPrecioCompra').click(function () {
                $('#txtPrecioCompra').css({ 'background-color': 'white' });
                $('#lblResultado').text("");
            });
            $('#txtPvp').click(function () {
                $('#txtPvp').css({ 'background-color': 'white' });
                $('#lblResultado').text("");
            });
         
        });
    </script>
</head>
<body style="background-color: grey">
    <form id="form1" runat="server">
       <!--Script manager con la referencia a bootstrap -->
        <asp:ScriptManager runat="server" ID="smBootstrap">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/bootstrap.min.js" />
            </Scripts>
        </asp:ScriptManager>
        <!--Menu-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <a class="navbar-brand" href="#">MENU</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link"  href="frminicio.aspx">Productos</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="Stock" href="frmAdministracion.aspx">Administracion</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <!--Cabecera-->
        <div style="text-align: center; background-color:aqua">
            <asp:Label ID="lblCabecera" runat="server" Font-Bold="True" Text="ADMINISTRACION"/>        
        </div>
        <br/>
        <!--Botones Nuevo/Edit-->
        <div style="text-align:center" class= "form-group">
        <input type="button" id="btnAlta" style="margin-left:20px;width: 300px; height:50px" value="Nuevo"/><input type="button" id="btnModificacion" style="margin-left:20px;width: 300px; height:50px" value="Editar"/>
        </div>
        <br/>
        <br/>
        <!--Campos Admin-->
        <div style="text-align:center" >
        <fieldset id="field"style="margin:auto ;border-style:solid;border-width:4px;border-color:black;background-color:aquamarine;max-width:600px">
            <br/>
            <legend>Información del producto</legend>
        <asp:Label ID="lblNombre" runat="server" Text="Nombre: "/>
        <br/> 
        <asp:TextBox ID="txtNombre" runat="server"/>
        <asp:DropDownList ID="CmbProductos" runat="server"/>
        <br/>
        <br/>
        <asp:Label ID="lblCantidadMinima" runat="server" Text="Cantidad Minima:"/>
        <br/>
        <asp:TextBox ID="txtCantidadMinima" runat="server" />
        <br/>
        <asp:Label ID="lblCantidad" runat="server" Text="Cantidad: "/>
        <br/>
        <asp:TextBox ID="txtCantidad" runat="server" />
        <br/>
        <br/>
        <asp:Label ID="lblPrecioCompra" runat="server" Text="Precio Compra: "/>
        <br/>
        <asp:TextBox ID="txtPrecioCompra" runat="server" />
        <br/>
        <asp:Label ID="lblPvp" runat="server" Text="P.V.P: "/>
        <br/>
        <asp:TextBox ID="txtPvp" runat="server" />
        <br/>
        <br/>
        <input type="button" id="btnGuardar" style="margin-left:20px" value="Guardar"/>
        <input type="button" id="btnCancelar" style="margin-left:20px" value="Cancelar"/>
        <br/>
        <br/>
        <asp:Label ID="lblResultado" runat="server"></asp:Label>
        <br/>
        <br/>
        </fieldset>
        </div> 
    </form>
</body>
</html>
