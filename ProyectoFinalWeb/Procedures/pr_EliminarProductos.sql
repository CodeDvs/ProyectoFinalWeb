create procedure pr_EliminarProductos
@p_Nombre varchar(25)
as
declare @v_id int
begin
Delete from Productos where NombreProducto = @p_Nombre
set @v_id =(Select idProducto from Productos where NombreProducto = @p_Nombre)
Delete from CosteProducto where idProducto = @v_id
end
