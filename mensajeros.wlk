///// PRIMERA PARTE: DESTINOS Y MENSAJEROS /////

class Paquete {
  var property destino
  var property estaPago
  var property precio = 50

  method puedeSerEntregadoPor(mensajero) {
    return mensajero.puedeLlegarA(destino) && self.estaPago()
  }

  method serEntregadoPor(mensajero) {
    mensajero.entregar(self)
  }

}


/// MENSAJEROS ///
class Mensajero {

  method puedeLlegarA(destino) {
    return destino.cumpleCondicion(self)
  }

  method puedeEntregar(paquete) = paquete.puedeSerEntregadoPor(self)

  method entregar(paquete) {
    
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

///// SEGUNDA PARTE: EMPRESA DE MENSAJERÍA /////

class EmpresaDeMensajeria {
  var property mensajeros = []
  var property paquetesPendientes = []
  
  method contratarA(mensajero) {
    mensajeros.add(mensajero)
  }

  method despedirA(mensajero) {
    mensajeros.remove(mensajero)
  }

  method despedirTodos() {
    mensajeros.clear()
  }

  method esGrande() = (mensajeros.size() > 2)

  method entregaPrimerEmpleado(paquete) = paquete.puedeSerEntregadoPor(mensajeros.first())

  method pesoUltimoEmpleado() = mensajeros.last().peso()

  method puedeEntregar(paquete) = mensajeros.any({m => m.puedeEntregar(paquete)})

  method mensajerosQuePuedenLlevar(paquete) = mensajeros.filter({m => m.puedeEntregar(paquete)})

  method tieneSobrepeso() = (mensajeros.sum({m => m.pesoTotal()}) / mensajeros.size()) > 500

  method enviar(paquete) {
    if (self.puedeEntregar(paquete)) {
      (self.mensajerosQuePuedenLlevar(paquete).anyOne()).entregar(paquete)
    } else {
      self.paquetesPendientes().add(paquete)
    }
  }

  method enviarPaquetes(listaPaquetes) {
    listaPaquetes.forEach({p => p.serEntregadoPor(mensajeros.anyOne())})
  }

  method enviarPaquetePendienteMasCaro() {
    const paqueteMasCaro = paquetesPendientes.max({p => p.precio()})
    
    if (self.puedeEntregar(paqueteMasCaro)) {
      paquetesPendientes.remove(paqueteMasCaro)
      paqueteMasCaro.serEntregadoPor(mensajeros.anyOne())
    } else {
      self.error("No pudo enviarse paquete")
    }
  }
}

///// TERCERA PARTE: MENSAJERÍA RECARGADA /////

class Paquetito inherits Paquete {
  override method precio() = 0
  override method estaPago() = true
  override method puedeSerEntregadoPor(mensajero) = true
}

class PaquetonViajero inherits Paquete {
  override method precio() = 100 * cantDestinos
  var property cantDestinos
  var property pagoParcial = 0

  method pagarParcial(monto) {
    pagoParcial += monto
  }
  override method estaPago() = (pagoParcial == precio)

  override method puedeSerEntregadoPor(mensajero) = self.estaPago()

}



//FALTAN TESTS//