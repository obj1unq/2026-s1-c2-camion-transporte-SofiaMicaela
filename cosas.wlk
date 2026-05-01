object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}
object arenaDeGranel{
	var peso = 0
	method peso(_peso) {
		peso = _peso
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
}
object bumblebee {
	var forma = auto
	method peso() { return 800 }
	method nivelPeligrosidad() { 
		if (forma == auto){
			return 15
		}
		else {return 30}
	}
	method activarModo(modo) {
	  forma = modo
	}
}
object auto {
  
}
object robot {
  
}
object paqueteDeLadrillos {
	var cantidad = 0
	method cantidad(_cantidad) {cantidad= _cantidad}
	method peso() { return 2 * cantidad }
	method nivelPeligrosidad() { return 2 }
}
object bateriaAntiaerea {
	var misiles = false
	method cargarMisiles() {misiles = true}
	method peso() { if (misiles){return 300} else {return 200}}
	method nivelPeligrosidad() {if (misiles){return 100}else{return 0} }
}
object residuosRadiactivos {
	var peso = 0

	method peso(_peso) {
	  peso = _peso
	}
	method peso() {
	  return peso
	}
	method nivelPeligrosidad(){
		return 200
	}
}
object contenedorPortuario {
	const property cosas = #{}

	method agregar(unaCosa) {
		cosas.add(unaCosa)
	}
	method peso(){
		return 100 + cosas.sum({cosa => cosa.peso()})
	}
	method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		}
		return cosas.max({cosa => cosa.nivelPeligrosidad()})
	}
}

object embalajeSeguridad {
	var contenido = null

	method envolver(unaCosa){
		contenido = unaCosa
	}
	method peso(){
		return contenido.peso()
	}
	method nivelPeligrosidad(){
		return contenido.nivelPeligrosidad() / 2
	}
}

