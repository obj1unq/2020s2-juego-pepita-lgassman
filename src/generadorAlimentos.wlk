import wollok.game.*
import randomizer.*
import comidas.*

object manzanaFactory {
	method nuevoAlimento() {
		return new Manzana(position = randomizer.emptyPosition())
	}
}

object alpisteFactory  {
	method nuevoAlimento() {
		return new Alpiste(position = randomizer.emptyPosition(), peso = (40..100).anyOne())
	}
}

object generadorAlimentos {
	
	const generados = #{}
	const maximo = 3
	const factories= [manzanaFactory, alpisteFactory]
	
	method nuevoAlimento() {
		if (generados.size() < maximo) {
			const alimento = factories.get((0..1).anyOne()).nuevoAlimento()
			
			generados.add(alimento)
	     	game.addVisual(alimento)
     	}
	}
	
	method seComio(unAlimento) {
		generados.remove(unAlimento)
        game.removeVisual(unAlimento)
    }
	
}
