import direcciones.*
import extras.*
import comidas.*
import niveles.*
import wollok.game.*

object pepita {
	const energiaInicial = 100
	const posicionInicial = game.at(0,1)
	const predador = silvestre
	const hogar = nido
	const joules = 9

	var property position = posicionInicial
	var energia = energiaInicial
	var property atrapada = false

	method inicializar() {
		position = game.at(0,1)
		energia = energiaInicial
		atrapada = false
	}
	
	method image() = "pepita-" + self.estado() + ".png"


	method estado(){
		return if (!self.estaViva()) { "gris" }
		  else if (self.enHogar()) { "grande"  }
			else { "base" }
	}

	method comerAca(){
			const comida = self.loQueHayAca()
			self.comer(comida)
			comida.eliminar()
	}

	method teAtraparon() {
		if(self.estaSobre(predador)){
		self.atrapada(true)
		game.say(self, "¡PERDÍ! presiona la R para reiniciar")
		game.schedule(2000, {self.perder()})
		}
	}

	method loQueHayAca() = game.uniqueCollider(self)

	method estaViva() =  energia >= self.energiaNecesaria(1) && not self.atrapada() 

	method enHogar() = self.estaSobre(hogar)

	method estaSobre(alguien) = position == alguien.position()

	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method mover(direccion){
		if(self.puedeMover(direccion) && self.estaViva()){
			self.volar(1)
			position = direccion.siguiente(position)
		} else if(!self.estaViva()){
			game.say(self, "¡PERDÍ! presiona la R para reiniciar")
			game.schedule(2000, {self.perder()})
		}
	}

	method puedeMover(direccion) = direccion.puedeMover(position)  
	
	method perder(){
		keyboard.r().onPressDo {
			game.clear()
			nivel1.inicializar()
			self.inicializar()
		}
	}

	method gane() {
		if(self.enHogar()){
	  game.say(self, "¡GANE!")
	  game.schedule(2000, {game.stop()})}
	}

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
		if (self.puedeMover(abajo) && self.estaViva()) {
			position = position.down(1)
		}
	} 
}

