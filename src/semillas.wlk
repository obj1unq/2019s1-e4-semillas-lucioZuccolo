import parcelas.*

//medidas en centimetros
class Planta {
	
	const property anioObtencionSemilla
	const property altura
	
	method anioEnElQueSeObtuvoLaSemilla(anio) = anioObtencionSemilla == anio
	method definirAltura(altura_) = altura == altura_
	method superaLaAltura(altura_) = return altura < altura_
	method seAsociaBien(parcela){
		return parcela.seAsociaBien(self)
	}
}


class Menta inherits Planta{
	
	const property horasDeSolToleradas = 6
	
	method horasDeSolToleradas() {return horasDeSolToleradas}
	method espacioQueOcupa(){return altura*3}
	method horasDeSol() {return horasDeSolToleradas}
	method esFuerte() { return horasDeSolToleradas > 10 }
	method daSemillas() { return self.esFuerte() or altura > 40 }
	method parcelaIdeal(parcela){ return parcela.superficie() > 600 }
	method toleraLasHorasDeSol(parcela){ return parcela.horasDeSol() > self.horasDeSol()}
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa() { return (altura*3)*2}
}

class Soja inherits Planta{
	const property horasDeSolToleradas = self.calcularToleranciaAlSol()	
	
	method esFuerte() { return horasDeSolToleradas > 10 }
	method horasDeSol() {return horasDeSolToleradas}
	method calcularToleranciaAlSol(){
		if (altura <= 50 )  {return 6}
		else if (altura > 50 and altura <= 100){return 7}
		else {return 9}
		}
	method horasDeSolToleradas() {return horasDeSolToleradas}
	method daSemillas(){return anioObtencionSemilla > 2007 and altura > 100}
	method parcelaIdeal(parcela){return self.horasDeSol() == parcela.horasDeSol()}
}

class SojaTrans inherits Soja{
		override method daSemillas() { return false }
		override method parcelaIdeal(parcela){
			return parcela.cantidadMaximaDePlantas() <= 1
		}
}

class Quinoa inherits Planta{
	var property horasDeSolToleradas
	
	method horasDeSolToleradas() {return horasDeSolToleradas}
	method esFuerte() { return horasDeSolToleradas > 10 }	
	method horasDeSol() {return horasDeSolToleradas}
	method daSemillas(){ return self.porHorasDeSolToleradas() or anioObtencionSemilla < 2005 }
	method porHorasDeSolToleradas(){return true} //VOLVER A ESTE PUNTO
	method parcelaIdeal(parcela,altura_){
		return not parcela.plantasEnLaParcela().any({planta => planta.superaLaAltura(altura_)})
	}
}




