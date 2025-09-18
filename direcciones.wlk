object arriba{
    method siguiente(posicion) = posicion.up(1)
    method puedeMover(posicion) = self.siguiente(posicion).y() < game.height()
}

object abajo{
    method siguiente(posicion) = posicion.down(1)
    method puedeMover(posicion) = self.siguiente(posicion).y() >= 0
}

object derecha{
    method siguiente(posicion) = posicion.right(1)
    method puedeMover(posicion) = self.siguiente(posicion).x() < game.width()
}

object izquierda{
    method siguiente(posicion) = posicion.left(1)
    method puedeMover(posicion) = self.siguiente(posicion).x() >= 0
}