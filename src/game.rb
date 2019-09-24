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
    @posicao_nave = 0
  end

  def tela
    @tela + nave
  end

  def direita
    @posicao_nave += 2
  end

  def esquerda
    @posicao_nave -= 2
    @posicao_nave = 0 if @posicao_nave < 0
  end

  def nave
    inicio = ' ' * @posicao_nave
    fim = ' ' * (10 - @posicao_nave)
    inicio + 'A ' + fim
  end
end
