object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() { return 1
	}
	method accidentarse() {
	  
	}
}
object arenaDeGranel{
	var peso = 0
	method peso(_peso) {
		peso = _peso
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method bulto() { return 1
	}
	method accidentarse() {
	  peso = peso + 20
	}
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
	method bulto() {return 2
	  
	}
	method accidentarse() {
	  if (forma == auto){
		forma = robot
	  }
	  else {forma = auto}
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
	method bulto() {
	  if (cantidad <= 100){
		return 1
	  }else if (cantidad <= 300){return 2}
	  		else{return 3}
	}
	method accidentarse() {
	  if (cantidad < 12){
		cantidad = 0
	  }
	  else{
		cantidad = cantidad - 12
	  }
	}
}
object bateriaAntiaerea {
	var misiles = false
	method cargarMisiles() {misiles = true}
	method peso() { if (misiles){return 300} else {return 200}}
	method nivelPeligrosidad() {if (misiles){return 100}else{return 0} }
	method bulto() {
		if (misiles){
			return 2
		}else{return 1}
	}
	method accidentarse() {
	  misiles = false
	}
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
	method bulto() { return 1
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
	method bulto() {
		return 1 + cosas.sum({cosa => cosa.bulto()})
	}
	method accidentarse() {
		cosas.forEach({cosa => cosa.accidentarse()})
	  
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
	method bulto() {return 2
	  
	}
	method accidentarse() {
	  
	}
}

