class Game
  attr :tela

  def initialize()
    @tela =
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n" +
    "w w w w     \n"
    @posicao_nave = 0
    @posicao_tiro_x = nil
    @posicao_tiro_y = nil
  end

  def tela
    (1..8).to_a.reverse.map { |linha| desenha_linha(linha) }.join("\n") + "\n#{nave}"
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

  def desenha_linha(linha)
    return linha_base(linha) unless @posicao_tiro_y == linha

    inicio = ' ' * @posicao_tiro_x
    fim = ' ' * (10 - @posicao_tiro_x)
    inicio + '| ' + fim
  end

  def linha_base(linha)
    return "            " if linha < 4
    "w w w w     "
  end

  def tick
    @posicao_tiro_y += 1 if @posicao_tiro_y
  end
end
