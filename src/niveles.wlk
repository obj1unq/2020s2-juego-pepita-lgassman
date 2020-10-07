import pepita.*
import comidas.*
import extras.*
import wollok.game.*
import randomizer.*

// Framework
// Es como una librería / biblioteca.
// Pero en una biblioteca, nosotros tenemos el control y usamos los objetos.
// En un framework, él tiene el control y usa nuestros objetos
object tutorial1 {

	method iniciar() {
		// Los visuales deben entender 2 mensajes:
		// position() 	-> Que devuelve una posición
		// image()		-> Devolver el nombre de la imagen que se quiere mostrar	
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual( new Manzana() )
		game.addVisual(new Alpiste() )
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(new Manzana())
		game.addVisual(new Alpiste())
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()
		config.configurarColisiones()
		// En 1 minuto se pierde
		game.schedule(1000 * 60, { pepita.perder() })
		game.say(pepita, "Tenés 1 min para llegar al nido.")
	}

}

object tutorial4 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()
		config.configurarColisiones()
		// En 1 minuto se pierde
		game.schedule(1000 * 60, { pepita.perder() })
		game.onTick(3000, "NUEVA_COMIDA", { generadorAlimentos.nuevoAlimento() })
		game.say(pepita, "Tenés 1 min para llegar al nido.")
	}

}


object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irASiSeMantieneEnLaPantalla(pepita.position().left(1)) })
		keyboard.right().onPressDo({ pepita.irASiSeMantieneEnLaPantalla(pepita.position().right(1)) })
		keyboard.up().onPressDo({ pepita.irASiSeMantieneEnLaPantalla(pepita.position().up(1)) })
		keyboard.down().onPressDo({ pepita.irASiSeMantieneEnLaPantalla(pepita.position().down(1)) })
		keyboard.c().onPressDo({ pepita.comerLaComidaQueTenesDebajo()  })
	}
	
	method configurarGravedad() {
		// Ejecuta el bloque de código cada 800 ms
		game.onTick(800, "GRAVEDAD", { pepita.caerPorGravedad() })

		// Si en algún momento queremos frenar la gravedad, habría que remover el tick
		// game.removeTickEvent("GRAVEDAD")
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo =>
			// La acción de colisionar depende del "algo" contra el que colisiona 
			// Entonces lo mejor es enviarle el mensaje a ese "algo"
			// Porque POLIMORFISMO 
			// -> No importa qué es contra lo que colisiona pepita
			// -> La acción de la colisión la "decide" el objeto colisionado
			algo.teEncontro(pepita)
		})
	}

}

