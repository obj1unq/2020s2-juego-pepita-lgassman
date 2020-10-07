import wollok.game.*
import randomizer.*

class Manzana {

	const property position = game.at(1, 8)

	method image() = "manzana.png"
	
	method energiaQueOtorga() = 40

	method teEncontro(ave) {
		ave.come(self)
	}

}


class Alpiste {

	const property position = game.at(2, 2)
	const peso = 70

	method image() = "alpiste.png"

	method energiaQueOtorga() = peso

	method teEncontro(ave) {
		ave.come(self)
	}

}

object manzanaFactory {
   
   method construirAlimento() {
   		return new Manzana(position=randomizer.emptyPosition())
   }	
}

object alpisteFactory {
   method construirAlimento() {
   		return new Alpiste(position=randomizer.emptyPosition(), peso = (40..100).anyOne())
   }		
}

object generadorAlimentos{ 
	
	const alimentosGenerados = #{}
	const maximo = 3
    const factoriesAlimentos = [ manzanaFactory, alpisteFactory]; 
    
	
	method nuevoAlimento() {
	
		if(alimentosGenerados.size() < maximo) {
			const factoryElegida = factoriesAlimentos.get((0..factoriesAlimentos.size() - 1).anyOne() ) 
			const nuevoAlimento = factoryElegida.construirAlimento()
			game.addVisual(nuevoAlimento)
			alimentosGenerados.add(nuevoAlimento)
		}
	}
	
	method removerAlimento(alimento) {
		if(game.hasVisual(alimento)) {
			game.removeVisual(alimento)
			alimentosGenerados.remove(alimento)
		}
	}
	
	
}

