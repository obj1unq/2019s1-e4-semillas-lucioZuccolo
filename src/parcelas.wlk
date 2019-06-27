import semillas.*

//medidas en centimetros
class Parcelas{
	const property ancho
	const property largo
	const property horasDeSol
	var property plantas =[]
	
	method plantasEnLaParcela() = return plantas
	method horasDeSol(){return horasDeSol}
	method superficie(){return ancho*largo}
	method cantidadMaximaDePlantas(){
		if (ancho > largo){return self.superficie()/5}
		else {return (self.superficie()/3)+largo}
	}	
	method tieneComplicaciones(parcela){
		return plantas.all( {planta => planta.toleraLasHorasDeSol(self)} )
	}
	method plantar(planta){
		if (self.hayEspacio() and self.plantaToleraElSol(planta)){
			plantas.add(planta)
		}else{
			self.error("No se puede plantar!")
		}
	}
	
	
	method hayEspacio(){ return plantas.size() > self.cantidadMaximaDePlantas() }
	method plantaToleraElSol(planta) { return self.horasDeSol() > (2 + planta.horasDeSol())}
	method tieneMasDe4Plantas() {return plantas.size() > 4}
}

class ParcelaEcologica inherits Parcelas{
	
	method seAsociaBien(planta){
		return planta.parcelaIdeal(self) and planta.toleraLasHorasDeSol(self)
	}	
}

class ParcelaIndustrial inherits Parcelas{
	method seAsociaBien(planta){
		return planta.esFuerte(self) and self.plantasEnLaParcela().size() == 2
	}
}

