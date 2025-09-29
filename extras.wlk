import pepita.*
import wollok.game.*


object nido{
    const property position = game.at(8, 8)

    method image() = "nido.png"

    method accion(alguien) {
      alguien.gane()
    } 

}

object silvestre{
    const presa = pepita

    method image() = "silvestre.png"

    method position() = game.at(self.x(), 0)

    method x() = 3.max(presa.position().x()) 

    method accion(alguien){
      alguien.teAtraparon()
    }
}

class Muro{
  var property position

  method image() = "muro.png"

  method accion(alguien) {
    alguien.retroceder()
  }

}