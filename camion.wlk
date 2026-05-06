import cosas.*
import rutas.*
import almacen.*



object camion {
	const property cosas = #{}
	//const property tara = 1000
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
		/*
		if(cosas.contains(unaCosa)){
			self.error(unaCosa.toString() + " ya esta cargado")
		}
		else {cosas.add(unaCosa)}*/
	}
	method validarCarga(unaCosa) {
		if (cosas.contains(unaCosa)){
			self.error(unaCosa.toString() + " ya esta cargado")}
	}
	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	method validarDescarga(unaCosa) {
		if (cosas.contains(unaCosa)){
			self.error(unaCosa.toString() + " no esta cargado")
		}
	}
	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso()% 2 == 0})
	}
	method cosaQuePese(cantidad) {
		return cosas.any({cosa => cosa.peso() == cantidad})	  
	}
	method tara() {
	  return 1000
	}
	method pesoTotal() {
	  return self.tara() + cosas.sum({cosa => cosa.peso()})
	}
	method excedido() {
	  return self.pesoTotal() > 2500
	}
	method cosaConNivelDePeligrosidad(cantidad) {
		return cosas.find({cosa => cosa.nivelPeligrosidad() == cantidad})
	}
	method cosasPeligrosas(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method cosasMasPeligrosasQue(otraCosa){
		return self.cosasPeligrosas(otraCosa.nivelPeligrosidad())
	}
	method puedeCircular(nivel){
		return !self.excedido() && cosas.all({cosa => cosa.nivelPeligrosidad()<= nivel})
	}
	method tieneAlgoQuePesaEntre(min,max){
		return cosas.any({cosa => cosa.peso() >= min && cosa.peso() <= max})
	}
	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}
	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}
	method bultos() {
	  return cosas.sum({cosa => cosa.bulto()})
	}
	method sufrirAccidente() {
	  cosas.forEach({cosa => cosa.accidentarse()})
	}
	method transportar(destino,camino) {
	camino.validarViaje(self)
	destino.recibir(cosas)
	cosas.clear()
	}
}
