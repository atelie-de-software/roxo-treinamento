class Game
  attr :tela

  def initialize()
    @tela =
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "            \n" +
    "            \n" +
    "            \n"
    @nave = "A           "
    @inicio = 0
    @fim = 10
  end

  def tela
    @tela + @nave
  end

  def direita
    @inicio = "  "
    @fim = "        "
    @nave =@inicio + "A " + @fim
  end

  def esquerda
  end

  def tiro
  end

  def tick
  end
end
