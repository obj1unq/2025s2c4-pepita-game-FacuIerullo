import extras.*

object arriba{
    method siguiente(posicion) = posicion.up(1)
    method hayMuro(posicion) = self.siguiente(posicion) == muro1.position() || self.siguiente(posicion) == muro2.position() || self.siguiente(posicion) == muro3.position()
    method puedeMover(posicion) = self.siguiente(posicion).y() < game.height() && !self.hayMuro(posicion)
}

object abajo{
    method siguiente(posicion) = posicion.down(1)
    method hayMuro(posicion) = self.siguiente(posicion) == muro1.position() || self.siguiente(posicion) == muro2.position() || self.siguiente(posicion) == muro3.position()
    method puedeMover(posicion) = self.siguiente(posicion).y() >= 0 && !self.hayMuro(posicion)
}

object derecha{
    method siguiente(posicion) = posicion.right(1)
    method hayMuro(posicion) = self.siguiente(posicion) == muro1.position() || self.siguiente(posicion) == muro2.position() || self.siguiente(posicion) == muro3.position()
    method puedeMover(posicion) = self.siguiente(posicion).x() < game.width() && !self.hayMuro(posicion)
}

object izquierda{
    method siguiente(posicion) = posicion.left(1)
    method hayMuro(posicion) = self.siguiente(posicion) == muro1.position() || self.siguiente(posicion) == muro2.position() || self.siguiente(posicion) == muro3.position()
    method puedeMover(posicion) = self.siguiente(posicion).x() >= 0 && !self.hayMuro(posicion)
}