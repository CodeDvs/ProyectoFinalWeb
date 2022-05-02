ALTER procedure pr_EditarProductos
@p_Id char(5),
@p_Nombre varchar(25),
@p_CantidadMin smallint,
@p_Cantidad smallint,
@p_PrecioCoste money,
@p_Pvp money,
@p_Salida int output
as
begin
Update Productos set NombreProducto=@p_Nombre, CantidadMinima=@p_CantidadMin,CantidadTotal=@p_Cantidad  where  idProducto=@p_Id
Update CosteProducto set CosteProducto=@p_PrecioCoste,Pvp=@p_Pvp where idProducto=@p_Id
set @p_Salida = 0
end