///// PRIMERA PARTE: DESTINOS Y MENSAJEROS /////

class Paquete {
  var property destino
  var property estaPago

  method puedeSerEntregadoPor(mensajero) {
    return self.destino().cumpleCondicion(mensajero) && self.estaPago()
  }
  
}


/// MENSAJEROS ///

class Mensajero {

  method puedeLlegarA(destino) {
    return destino.cumpleCondicion(self)
  }
}


object neo inherits Mensajero {
  var property peso = 0
  var property tieneCredito = true

  method pesoTotal() = self.peso()

  method puedeHacerLlamada() {
    return self.tieneCredito()
  }

}

object chuckNorris inherits Mensajero {
  var property peso = 900
  const property puedeHacerLlamada = true

  method pesoTotal() = self.peso()
}

object roberto inherits Mensajero {
  var property transporte = bicicleta //o camion
  var property peso = 90 //qsy, por tirar...
  const property puedeHacerLlamada = false

  method pesoTotal() = self.peso() + transporte.peso()
}

object bicicleta {
  var property peso = 1
}

object camion {
  var property cantidadDeAcoplados = 3 //...

  method peso() = cantidadDeAcoplados * 500
}


/// DESTINOS ///
object puenteDeBrooklyn {
  
  method cumpleCondicion(mensajero) {
    return mensajero.pesoTotal() <= 1000 
  }
}

object laMatrix {
  
  method cumpleCondicion(mensajero) {
    return mensajero.puedeHacerLlamada()
  }
}