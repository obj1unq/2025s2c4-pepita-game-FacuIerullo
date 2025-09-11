import extras.*

object pepita {
	var energia = 100
	var property position = game.at(0,1)
	const predador = silvestre
	const hogar = nido
	
	method image() = "pepita-" + self.estado() + ".png"


	method estado(){
		return if (self.estaSobre(predador)){"gris"}
		       else if(self.estaSobre(hogar)){"grande"}
			   else {"base"}
	}
	
	method estaSobre(alguien) = self.position() == alguien.position()

	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method redibujarse(){
	  game.removeVisual(self)
	  game.addVisual(self)
	}

}

