import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.atrapada() or self.estaCansada()) 
			"pepita-gris.png" 
		else if (self.estaEnElNido()) 
			"pepita-grande.png" 
		else 
			"pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method comerLaComidaQueTenesDebajo() {
		self.come(self.comidaDebajo())
		game.removeVisual(self.comidaDebajo())
	}
	
	method comidaDebajo() {
		const comidas = game.colliders(self)
		if (comidas.isEmpty()) {
			self.error("No hay comida acá")
		}
		return comidas.head()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		// Precondiciones
		self.validarParaMoverse(nuevaPosicion)
		// Acción
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		// Postcondiciones
		self.checkearSiTerminoElJuego()
	}
	
	method irASiSeMantieneEnLaPantalla(nuevaPosicion) {
		if (self.estaDentroDeLaPantalla(nuevaPosicion)) {
			self.irA(nuevaPosicion)
		}
	}

	method validarParaMoverse(nuevaPosicion) {
		if (self.estaCansada()) {
			self.error("Estoy cansada")
		}
		if (not self.estaDentroDeLaPantalla(nuevaPosicion)) {
			self.error("No me puedo salir de la pantalla")
		}
	}
	
	// Este método podría estar en algún otro objeto que se encargue de la configuración del juego
	method estaDentroDeLaPantalla(nuevaPosicion) {
		return 	nuevaPosicion.x().between(0, game.width() - 1)
		and		nuevaPosicion.y().between(0, game.height() - 1)
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}

	method atrapada() {
		return position == silvestre.position()
	}
	
	method checkearSiTerminoElJuego() {
		if (self.estaCansada()) {
			game.stop()
		} 
	}
	
	method caerPorGravedad() {
		const nuevaPosicion = position.down(1)
		if (self.estaDentroDeLaPantalla(nuevaPosicion)) {
			position = nuevaPosicion  
		}
	}
	
	method ganar() {
		game.say(self, "¡GANE!")
		self.finalizarJuego()
	}
	
	method perder() {
		game.say(self, "¡PERDÍ!")
		self.finalizarJuego()
	}
	
	method finalizarJuego() {
		// Esto ejecuta el bloque de código una vez en 2 segundos
		game.schedule(2000, { game.stop() })
	}

}

