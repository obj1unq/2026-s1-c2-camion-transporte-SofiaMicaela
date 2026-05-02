import camion.*
object ruta9 {
  method permiteViajar(camion) {
    return camion.puedeCircular(20)
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
}