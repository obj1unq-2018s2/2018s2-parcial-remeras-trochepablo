class Pedido {
	const modeloRemera
	const cantidad
	var porcentajeDesc
	const sucursal 
	const empresasConvenio = []
	
	method precio() {
		
		var precio = modeloRemera.costo() * cantidad
		if (sucursal.cantidadMinDes() <= cantidad) {
			precio = precio - (precio * porcentajeDesc / 100)
		}
		return precio
	}
	
	method calcularPorcentajeDesc(){
		if (self.hayConvenioConEmpresa()) {
			porcentajeDesc = 20
		}else{
			porcentajeDesc = modeloRemera.calcularPorcentanjeDes()
		}
	}
	
	method hayConvenioConEmpresa(){
		return modeloRemera.derechoDeAutor() 
			   && self.hayConvenio(modeloRemera.empresaDerechoAutor())
	}
	
	method hayConvenio(empresa) = empresasConvenio.contains(empresa)
	
	method esColor(color) = modeloRemera.color() == color
	method esTalle(talle) = modeloRemera.talle() == talle
}
