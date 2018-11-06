
class RemeraLisa {
	const property talle
	const property color
	
	method costo(){
		var costoTotal = self.costoTalle() * 10 / 100; // costo de cualquier color diferentes a los basicos
		if (colores.coloresBasicos().contains(color)) {
			costoTotal = self.costoTalle()
		}
		return costoTotal
	 }
	 
	 method costoTalle(){
		var costo = 0
		if (talle.between(32, 40)){
			costo = costoPorDefecto.lisa32a40()
		}
		if (talle.between(41, 48)){
			costo = costoPorDefecto.lisa41a48()
		}
		return costo
	}
	
	method PorcentajeDes() = 10
}

class RemeraBordada inherits RemeraLisa {
	const cantidadColores
	
	override method costo(){
		return super() + self.costoDeBordado()
	}
	method costoDeBordado(){
		var costo = 20
		if (cantidadColores > 1) {
			costo = cantidadColores * 10
		}
		return costo
	}
}

class RemeraSublimada inherits RemeraLisa{
	const alto
	const ancho
	const property derechoDeAutor = false
	const costoDerechoAutor = 0
	const property empresaDerechoAutor
	
	method superficie() = ancho * alto
	
	override method costo(){
		return super() + self.costoSublimado()
	}
	
	method costoSublimado(){
		var costo = self.superficie() * 0.50
		if (derechoDeAutor) {
			costo = costo + costoDerechoAutor
		}
		return costo
	} 
}


object talles{
	var property tamanios = [new Range(32, 48)]
}

object colores {
	const property coloresBasicos = ["blanco", "negro", "gris"]
}

// bonus
object costoPorDefecto {
	var property lisa32a40 = 80
	var property lisa41a48 = 100
}