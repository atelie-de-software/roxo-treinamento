class Game
  def initialize()
    @galaxia = [
      ['w', 'w', 'w', 'w', ' ', ' '],
      ['w', 'w', 'w', 'w', ' ', ' '],
      ['w', 'w', 'w', 'w', ' ', ' '],
      ['w', 'w', 'w', 'w', ' ', ' '],
      ['w', 'w', 'w', 'w', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' '],
      ['A', ' ', ' ', ' ', ' ', ' ']
    ]
    @posicao_nave = 0
    limpa_tiro
  end

  def tela
    (0..8).map { |linha| desenha_linha(linha) }.join("\n")
  end

  def direita
    @galaxia[8][@posicao_nave] = ' '
    @posicao_nave += 1
    @galaxia[8][@posicao_nave] = 'A'
  end

  def esquerda
    @galaxia[8][@posicao_nave] = ' '
    @posicao_nave -= 1
    @posicao_nave = 0 if @posicao_nave < 0
    @galaxia[8][@posicao_nave] = 'A'
  end

  def tiro
    @posicao_tiro_x = @posicao_nave
    @posicao_tiro_y = 8
  end

  def tick
    @posicao_tiro_y -= 1 if @posicao_tiro_y.positive?

    limpa_tela

    if (@posicao_tiro_x.positive? || @posicao_tiro_x.zero?) && @posicao_tiro_y.positive?
      if @galaxia[@posicao_tiro_y][@posicao_tiro_x] == ' '
        @galaxia[@posicao_tiro_y][@posicao_tiro_x] = '|'
      elsif @galaxia[@posicao_tiro_y][@posicao_tiro_x] == 'w'
        @galaxia[@posicao_tiro_y][@posicao_tiro_x] = '*'
        limpa_tiro
      end
    end
  end

  private

  def desenha_linha(linha)
    @galaxia[linha].join(' ') + ' '
  end

  def limpa_tela
    (0..7).map do |linha|
      @galaxia[linha].each_with_index do |_column, index|
        if @galaxia[linha][index] == '*' || @galaxia[linha][index] == '|'
          @galaxia[linha][index] = ' '
        end
      end
    end
  end

  def limpa_tiro
    @posicao_tiro_x = -1
    @posicao_tiro_y = -1
  end
end
