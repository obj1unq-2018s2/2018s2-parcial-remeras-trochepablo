import sucursal.*
import remeras.*

class Comercio {
 	var property sucursales = []
 	var property pedidosRealizados = [] // me equivoque, la sucursal tiene pedidos
 	
 	method nuevoPedido(pedido){ pedidosRealizados.add(pedido) }
 	method totalFacturado() = pedidosRealizados.sum { pedido => pedido.precio() }
 	method totalParaSucursal(sucursal) = sucursal.TotalFacturado()
 	method cantidadPedidosRemerasColor(color) = pedidosRealizados.count{ pedido => pedido.esColor(color) }
 	method pedidoMasCaro() = pedidosRealizados.max{ pedido => pedido.precio() }
 	method sucursalesNoVendieronTodosTalles() = talles.tamanios().filter{ 
 		talle => pedidosRealizados.all{ pedido => not pedido.esTalle(talle) }
 	}
 	method sucursalMaxFacturacion() =  sucursales.max{ suc => suc.totalFacturado() }
 	method sucursalesTodosTaller() = sucursales.filter{ suc => suc.vendioTodosTalles(talles.tamanios()) }
}
