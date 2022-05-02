ALTER procedure pr_ComprobarExistencias
@p_NombreProducto varchar(25),
@p_Salida int output
as
declare @v_Existencias smallint
begin
if(exists(Select NombreProducto from Productos where NombreProducto=@p_NombreProducto))
begin
Set @v_Existencias=(Select CantidadTotal from Productos where NombreProducto=@p_NombreProducto)
set @p_Salida=@v_Existencias
end
else
begin
set @p_Salida = -1
end
end