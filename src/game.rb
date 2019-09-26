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
    @move_monstro = false
    @conta_tick = 0
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
    movimenta_monstro
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
    caracter_atual = @galaxia[@posicao_tiro_y][@posicao_tiro_x]

    if caracter_atual == ' '
      altera_caracter(@posicao_tiro_y, @posicao_tiro_x, '|')
    elsif caracter_atual == 'w'
      altera_caracter(@posicao_tiro_y, @posicao_tiro_x, '*')
      @move_monstro = true
      limpa_tiro
    end
  end

  def movimenta_monstro
    return unless @move_monstro

    @conta_tick += 1
    return if @conta_tick < 10

    @conta_tick = 0

    @galaxia.each_with_index do |linha, linha_index|
      next if @galaxia.size == linha_index + 1
      @galaxia[linha_index] = linha.unshift(linha.pop)
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
