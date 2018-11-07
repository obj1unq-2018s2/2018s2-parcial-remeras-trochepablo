import pedidos.*

class Sucursal {
	var property pedidos = []
	const property cantidadMinDesc = 0
	
	method totalFacturado() = pedidos.sum{ pedido => pedido.precio() } 
	method vendioTodosTalles(talles) = 
		talles.all{ talle =>  pedidos.any{ pedido => pedido.esTalle(talle) } }
}
