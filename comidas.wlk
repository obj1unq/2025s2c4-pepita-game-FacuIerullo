import wollok.game.*

object manzana {
	const base= 5
	var madurez = 1
	var property position = game.at(4,4)

	method image() = "manzana.png"
	
	method energiaQueOtorga() {
		return base * madurez	
	}

	method eliminar(){
		game.removeVisual(self)
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

}

object alpiste {
	var property position = game.at(7,3)

	method image() = "alpiste.png"

	method energiaQueOtorga() {
		return 20
	} 

	method eliminar(){
		game.removeVisual(self)
	}
}

