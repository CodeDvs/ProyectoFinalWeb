create procedure pr_AltasProductos
@p_Id int,
@p_Nombre varchar(25),
@p_CantidadMin smallint,
@p_Cantidad smallint,
@p_PrecioCoste money,
@p_Pvp money,
@p_Salida int output
as
begin
/*Compruebo que no exista ya un producto con ese nombre*/
if(exists(Select NombreProducto from Productos where NombreProducto=@p_Nombre))
begin
/*Si existe ese producto, devuelvo un -1 y no inserto nada*/
set @p_Salida = -1
end
else
begin
insert into Productos (idProducto,NombreProducto,CantidadMinima,CantidadTotal) values (@p_Id,@p_Nombre,@p_CantidadMin,@p_Cantidad)
insert into CosteProducto (idProducto,CosteProducto,Pvp) values (@p_Id,@p_PrecioCoste,@p_Pvp)
set @p_Salida = 0
end
end
