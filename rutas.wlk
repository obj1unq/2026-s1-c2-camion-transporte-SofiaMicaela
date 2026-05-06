import camion.*
object ruta9 {
  method permiteViajar(camion) {
    return camion.puedeCircular(20)
  }
  method validarViaje(vehiculo) {
  if(!self.permiteViajar(vehiculo)) {
    self.error("No se puede transportar por este camino")
  }
}
}

object caminosVecinales {
  var pesoMaximo = 0

  method pesoMaximo(_pesoMaximo) {
    pesoMaximo = _pesoMaximo
  }
  method permiteViajar(camion) {
    return camion.pesoTotal() <= pesoMaximo
  }
  method validarViaje(vehiculo) {
  if(!self.permiteViajar(vehiculo)) {
    self.error("No se puede transportar por este camino")
  }
}
}