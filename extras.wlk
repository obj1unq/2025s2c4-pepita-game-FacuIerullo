import pepita.*
import wollok.game.*


object nido{
    const property position = game.at(8, 8)

    method image() = "nido.png"

}

object silvestre{
    const presa = pepita

    method image() = "silvestre.png"

    method position() = game.at(self.x(), 0)

    method x() = 3.max(presa.position().x()) 
}

object muro1 {
  method image() = "muro.png"

  method position() = game.at(2, 3)

}

object muro2 {
  method image() = "muro.png"

  method position() = game.at(7, 4)
}

object muro3 {
  method image() = "muro.png"

  method position() = game.at(8, 7)
}