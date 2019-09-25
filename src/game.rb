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

  def direita()  move  1 end
  def esquerda() move -1 end

  def tiro
    @posicao_tiro_x = @posicao_nave
    @posicao_tiro_y = 8
  end

  def tick
    limpa_galaxia
    movimenta_tiro
  end

  private

  def desenha_linha(linha)
    @galaxia[linha].join(' ') + ' '
  end

  def move(delta)
    @galaxia[8][@posicao_nave] = ' '
    @posicao_nave = [[@posicao_nave + delta, 0].max, 7].min
    @galaxia[8][@posicao_nave] = 'A'
  end

  def limpa_galaxia
    @galaxia = @galaxia.map do |linha|
      linha.map { |caracter| proximo_caracter(caracter) }
    end
  end

  def proximo_caracter(caracter)
    return ' ' if caracter == '*'
    return ' ' if caracter == '|'

    caracter
  end

  def movimenta_tiro
    return unless @posicao_tiro_y.positive?

    @posicao_tiro_y -= 1

    if @galaxia[@posicao_tiro_y][@posicao_tiro_x] == ' '
      altera_caracter(@posicao_tiro_y, @posicao_tiro_x, '|')
    else @galaxia[@posicao_tiro_y][@posicao_tiro_x] == 'w'
      altera_caracter(@posicao_tiro_y, @posicao_tiro_x, '*')
      limpa_tiro
    end
  end

  def altera_caracter(linha, coluna, caracter)
    @galaxia[linha][coluna] = caracter
  end

  def limpa_tiro
    @posicao_tiro_x = -1
    @posicao_tiro_y = -1
  end
end
