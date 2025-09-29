import direcciones.*
import extras.*
import comidas.*
import niveles.*
import wollok.game.*

object pepita {
	const energiaInicial = 100
	const posicionInicial = game.at(0,1)
	const hogar = nido
	const joules = 9

	var property position = posicionInicial
	var energia = energiaInicial
	var property atrapada = false
	var ultimaDireccion = null

	method inicializar() {
		position = game.at(0,1)
		energia = energiaInicial
		atrapada = false
	}
	
	method image() = "pepita-" + self.estado() + ".png"


	method estado(){
		return if (!self.puedeMover()) { "gris" }
		  else if (self.enHogar()) { "grande"  }
			else { "base" }
	}

	method comerAca(comida){
			self.comer(comida)
			comida.eliminar()
	}

	method teAtraparon() {
		self.atrapada(true)
		game.say(self, "¡PERDÍ! presiona la R para reiniciar")
		game.schedule(2000, {self.perder()})
	}

	method encontrasteAlgo(objeto) {
		objeto.accion(self)
	}

	method enHogar() = self.estaSobre(hogar)

	method estaSobre(alguien) = position == alguien.position()

	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method mover(direccion){
		if(self.puedeMover() && self.limites(direccion)){
			self.volar(1)
			position = direccion.siguiente(position)
			ultimaDireccion = direccion
		} else if(!self.puedeMover()){
			game.say(self, "¡PERDÍ! presiona la R para reiniciar")
			game.schedule(2000, {self.perder()})
		}
	}

	method puedeMover() = energia >= self.energiaNecesaria(1) && not self.atrapada()

	method limites(direccion) = direccion.siguiente(position).y() < game.height() && 
	direccion.siguiente(position).y() >= 0 &&
	direccion.siguiente(position).x() < game.width() &&
	direccion.siguiente(position).x() >= 0

	method retroceder() {
		position = ultimaDireccion.anterior(position)
	} 

	method perder(){
		keyboard.r().onPressDo {
			game.clear()
			nivel1.inicializar()
			self.inicializar()
		}
	}

	method gane() {
	  game.say(self, "¡GANE!")
	  game.schedule(2000, {game.stop()})}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method energiaNecesaria(kms) = joules * kms

	method volar(kms) {
		energia -= self.energiaNecesaria(kms) 
	}
	
	method energia() {
		return energia
	}

	method caerPorGravedad(){
		if (self.puedeMover()) {
			position = position.down(1)
		}
	} 
}

