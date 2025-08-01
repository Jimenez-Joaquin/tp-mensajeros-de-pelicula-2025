# Mensajeros de Película

## Primera parte: Destinos y mensajeros
Desarrollar y probar un programa que me permita saber si el paquete puede ser entregado por un mensajero. Un *paquete puede entregarse* cuando el mensajero puede llegar al destino indicado y además el paquete está pago.

#### Destinos posibles:
- **Puente de Brooklyn:** deja pasar a *todo lo que pese hasta una tonelada.*
- **La Matrix:** deja entrar a *quien pueda hacer una llamada.*

#### Mensajeros posibles:
- **Roberto:** Roberto viaja en bicicleta o camión. *Si viaja en bicicleta,* el peso que cuenta es el suyo propio más 1, que es lo que pesa la bici. *Si viaja en camión,* el peso es el propio más el del camión, a razón de media tonelada por cada acoplado. *Roberto no tiene un mango, gracias que tiene cubiertas, y no puede llamar a nadie.*
- **Chuck Norris:** Chuck norris *pesa 900 kg y puede llamar a cualquier persona del universo con sólo llevarse el pulgar al oído y el meñique a la boca.*
- **Neo:** vuela, así que no pesa nada. Y anda con celular, el muy canchero. El tema es que a veces no tiene crédito para hacer llamadas.


### Tests
Realizar una serie de tests, donde se prueben las diferentes situaciones, entre ellas:
1) Que Roberto (90kg) puede llevar un paquete que está pago en un camión que tiene un acoplado.
2) Que Neo con crédito no puede llevar un paquete que no está pago a la matrix.

---

## Segunda parte: Empresa de mensajería
Ahora aparece una empresa de mensajería. Esta tiene un conjunto de mensajeros, los cuales podrían ser Roberto, Chuck y Neo.

#### Se necesita poder hacer:
- Contratar a un mensajero.
- Despedir a un mensajero.
- Despedir a todos los mensajeros.
- Analizar si la mensajeria es grande (si tiene mas de dos mensajeros).
- Consultar si el paquete puede ser entregado por el primer empleado de la empresa de mensajería.
- Saber el peso del último mensajero de la empresa.
- Hacer algunos test significativos.


---

## Tercera parte: Mensajería recargada
Nuevos requerimientos para la mensajería. Surgen otros paquetes que la empresa necesita enviar:

- **Paquetito:** es gratis, o sea, *siempre está pago.* Además, *cualquier mensajero lo puede llevar.*
- **Paqueton viajero:** tiene múltiples destinos. *Su precio es 100$ por cada destino.* Se puede ir pagando parcialmente y se debe pagar totalmente para poder ser enviado. Además, el *mensajero debe poder pasar por todos los destinos.*
- Se sabe que el paquete original tiene un precio determinado en $50.

#### Se necesita realizar:
1) *Averiguar si un paquete puede ser entregado* por la empresa de mensajería, es decir, si al menos uno de sus mensajeros puede entregar el paquete.
2) Obtener todos los *mensajeros que pueden llevar un paquete dado.*
3) Saber si una mensajería tiene ***sobrepeso***. Esto sucede si el *promedio del peso de los mensajeros es superior a 500 Kg.*
4) Hacer que la ***empresa de mensajería envíe un paquete***. Para ello *elige cualquier mensajero entre los que pueden enviarlo y si no puede lo agrega a los paquetes pendientes.*
5) Dado un conjunto de paquetes, enviarlos a todos, de igual manera.
6) Encontrar el paquete pendiente más caro y enviarlo, actualizando los pendientes en caso de haberlo podido enviar.

#### ¡Importante!:
- Cada punto debe tener mínimo un test.
- Agregar un nuevo mensajero y un nuevo paquete y garantizar que todo siga funcionando.