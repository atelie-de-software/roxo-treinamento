class Game
  attr :tela

  def initialize()
    @galaxia = [
      ['w', 'w', 'w', 'w', ' ', ' '],
      ['w', 'w', 'w', 'w', ' ', ' '],
      ['w', 'w', 'w', 'w', ' ', ' '],
      ['w', 'w', 'w', 'w', ' ', ' '],
      ['w', 'w', 'w', 'w', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ']
    ]
    @posicao_nave = 0
    @posicao_tiro_x = nil
    @posicao_tiro_y = nil
  end

  def tela
    (0..7).map { |linha| desenha_linha(linha) }.join("\n") + "\n#{nave}"
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
    @posicao_tiro_y = 8
  end

  def desenha_linha(linha)
    return linha_base(linha) if @posicao_tiro_y.nil?

    if @galaxia[linha][@posicao_tiro_x] == 'w' && linha == @posicao_tiro_y
      @galaxia[linha][@posicao_tiro_x] = '*'
      @posicao_tiro_x = nil
      @posicao_tiro_y = nil
    elsif (@posicao_tiro_x.positive? || @posicao_tiro_x.zero?) && linha == @posicao_tiro_y
      @galaxia[linha][@posicao_tiro_x] = '|'
    elsif @galaxia[linha][@posicao_tiro_x] == '|' && linha != @posicao_tiro_y
      @galaxia[linha][@posicao_tiro_x] = ' '
    end

    linha_base(linha)


    # inicio = ' ' * @posicao_tiro_x
    # fim = ' ' * (10 - @posicao_tiro_x)
    # inicio + '| ' + fim
  end

  def linha_base(linha)
    @galaxia[linha].join(' ') + ' '
  end

  def tick
    @posicao_tiro_y -= 1 if @posicao_tiro_y
  end
end
