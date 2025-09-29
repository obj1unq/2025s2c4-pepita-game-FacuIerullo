import pepita.*
import extras.*
import comidas.*
import direcciones.*
import wollok.game.*

object nivel1 {
	method inicializar() {
		const personajes = [ nido, silvestre, alpiste, 
		new Manzana(position = game.at(4,4)),
		new Manzana(position = game.at(6,6), madurez = 10),
		pepita]
		
		personajes.forEach { el => game.addVisual(el) }

		const muros = (3..7).map { y => new Muro(position = game.at(3, y)) }
		muros.forEach { muro => game.addVisual(muro) }
        //game.onTick(800, "gravedad", { pepita.caerPorGravedad() })
		keyboard.up().onPressDo { pepita.mover(arriba) }
		keyboard.down().onPressDo { pepita.mover(abajo) }
		keyboard.left().onPressDo { pepita.mover(izquierda) }
		keyboard.right().onPressDo { pepita.mover(derecha) }

		game.onCollideDo(pepita, {algo => pepita.encontrasteAlgo(algo)})
		
	}
}