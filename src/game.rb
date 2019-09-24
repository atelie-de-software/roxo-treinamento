class Game
  attr :tela

  def initialize()
    @tela =
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "            \n"
    @posicao_nave = 0
    @posicao_tiro_x = nil
    @posicao_tiro_y = nil
  end

  def tela
    @tela + linha_2 + linha_1 + nave
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

  def tiro
    @posicao_tiro_x = @posicao_nave
    @posicao_tiro_y = 1
  end

  def linha_1
    return "            \n" unless @posicao_tiro_y == 1

    inicio = ' ' * @posicao_tiro_x
    fim = ' ' * (10 - @posicao_tiro_x)
    inicio + '| ' + fim + "\n"
  end

  def linha_2
    return "            \n" unless @posicao_tiro_y == 2

    inicio = ' ' * @posicao_tiro_x
    fim = ' ' * (10 - @posicao_tiro_x)
    inicio + '| ' + fim + "\n"
  end

  def tick
    @posicao_tiro_y += 1 if @posicao_tiro_y
  end
end
