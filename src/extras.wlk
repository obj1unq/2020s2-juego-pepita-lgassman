import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.stop()
	}
}

object silvestre {

	method image() = "silvestre.png"

	method position() = game.at(3, 0)

}

