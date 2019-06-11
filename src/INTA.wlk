import semillas.*
import parcelas.*

object inta {
	
	const property parcelas =[]
	
	method agregarParcela(parcela) {parcelas.add(parcela)}
	method promedioDePlantasPorParcela(){ 
		return parcelas.all({parcela => parcela.size().sum()}) / parcelas.size()
	}
	method parcelaMasSustentable(){
		return self.parcelaConMayorPorcentajeDePlantasBienAsociadas(self.parcelasConMasDe4Plantas(parcelas))
	}
	
	method parcelaConMayorPorcentajeDePlantasBienAsociadas(lista){
		return lista.max(({planta => planta.seAsociaBien(lista)}).size() / lista.size())
	}

	method parcelasConMasDe4Plantas(lista){
		return lista.filter({parcela => parcela.tieneMasDe4Plantas()})
	}	
}