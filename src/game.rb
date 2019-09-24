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
    @posicao_nave = 0
  end

  def tela
    @tela + @nave
  end

  def direita
    @posicao_nave += 2
    inicio = ' ' * @posicao_nave
    fim = ' ' * (10 - @posicao_nave)
    @nave = inicio + 'A ' + fim
  end

  def esquerda
    @posicao_nave -= 2
    inicio = ' ' * @posicao_nave
    fim = ' ' * (10 - @posicao_nave)
    @nave = inicio + 'A ' + fim
  end
end
