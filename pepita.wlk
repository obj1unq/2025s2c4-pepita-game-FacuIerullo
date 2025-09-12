import extras.*
import wollok.game.*


object pepita {
	var energia = 100
	var property position = game.at(0,1)
	const predador = silvestre
	const hogar = nido
	const joules = 9
	
	method image() = "pepita-" + self.estado() + ".png"


	method estado(){
		return if (self.esAtrapada() || !self.puedeMover()){"gris"}
		       else if(self.enHogar()){"grande"}
			   else {"base"}
	}

	method comerAca(){
		const comida = self.loQueHayAca()
		self.comer(comida)
		comida.eliminar()
	}
	method loQueHayAca() = game.uniqueCollider(self)

	method puedeMover() = energia >= self.energiaNecesaria(1) && not self.esAtrapada()

	method esAtrapada() = self.estaSobre(predador)

	method enHogar() = self.estaSobre(hogar)

	method estaSobre(alguien) = self.position() == alguien.position()

	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method mover(direccion){
		if(self.puedeMover()){
			self.volar(1)
			position = direccion.siguiente(position)
		} else {
			self.perder()
		}
	}

	method perder(){
		game.say(self, "Perdí!")
		game.schedule( 2000, { game.stop() })
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

	method redibujarse(){
	  game.removeVisual(self)
	  game.addVisual(self)
	}

}

