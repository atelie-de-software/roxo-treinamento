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
    "            \n" +
    "A            "
  end

  def tela
    @tela
  end

  def direita
    @tela =
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "            \n" +
    "            \n" +
    "            \n" +
    "  A          "
  end

  def esquerda
  end

  def tiro
  end

  def tick
  end
end
