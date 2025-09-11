import pepita.*

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


