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
      [' ', ' ', ' ', ' ', ' ', ' ']
    ]
    @game_over = false
    @posicao_nave = 0
    @move_monstro = false
    @direcao_movimento_monstro = 1
    @conta_inverte_direcao = 0
    @conta_tick = 0
    @conta_tiro = 0
    @tela_inicial = true
    @pontuacao = 0
    limpa_tiro
  end

  def tela
    return 'HOME' if tela_inicial?
    return 'GAMEOVER' if perdedor?
    return 'WINNER' if vencedor?
    galaxia_render = @galaxia.map(&:dup)
    galaxia_render.last[@posicao_nave] = 'A'
    galaxia_render[@posicao_tiro_y][@posicao_tiro_x] = '|' if renderiza_tiro?
    galaxia_render[0][0] = @pontuacao/10 if galaxia_render[0][0] != 'w' && @pontuacao > 0
    galaxia_render[0][1] = (@pontuacao % 10) if galaxia_render[0][1] != 'w' && @pontuacao > 0
    galaxia_render.map { |linha| desenha_linha(linha) }.join("\n")
  end

  def tela_inicial?
    @tela_inicial
  end

  def renderiza_tiro?
    return false if @posicao_tiro_y.negative?
    return false if @posicao_tiro_x.negative?

    @posicao_tiro_y < 8
  end

  def vencedor?
    @galaxia.map(&:join).join.count('w').zero?
  end

  def perdedor?
    @game_over
  end

  def direita()  move  1 end
  def esquerda() move -1 end

  def tiro
    return @tela_inicial = false if tela_inicial?

    easter_egg
    return if @posicao_tiro_y.positive?

    @posicao_tiro_x = @posicao_nave
    @posicao_tiro_y = 8
  end

  def easter_egg
    @conta_tiro += 1
    if @conta_tiro == 2
      @galaxia = [
        ['w', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ']
      ]
    end
  end

  def tick
    @conta_tiro = 0
    movimenta_monstro
    limpa_galaxia
    movimenta_tiro
    acerta_inimigo?
  end

  private

  def acerta_inimigo?
    mira = @galaxia[@posicao_tiro_y][@posicao_tiro_x]
    if mira == 'w'
      @galaxia[@posicao_tiro_y][@posicao_tiro_x] = '*'
      limpa_tiro
      @move_monstro = true
      @pontuacao += 1
      return true
    end

    false
  end

  def desenha_linha(linha)
    linha.join(' ') + ' '
  end

  def move(delta)
    @posicao_nave = [[@posicao_nave + delta, 0].max, 5].min
  end

  def limpa_galaxia
    @galaxia = @galaxia.map do |linha|
      linha.map { |caracter| proximo_caracter(caracter) }
    end
  end

  def proximo_caracter(caracter)
    return ' ' if caracter == '*'

    caracter
  end

  def movimenta_tiro
    return unless @posicao_tiro_y.positive?

    @posicao_tiro_y -= 1
  end

  def movimenta_monstro
    return unless @move_monstro

    @conta_tick += 1
    return if @conta_tick < 10

    @conta_tick = 0

    @conta_inverte_direcao += @direcao_movimento_monstro

    if @conta_inverte_direcao % 3 == 0
      @direcao_movimento_monstro *= -1
      @galaxia.unshift([' ', ' ', ' ', ' ', ' ', ' '])
      @galaxia.pop
      @game_over = true if @galaxia.last.count('w').positive?
      return true
    end

    @galaxia.each_with_index do |linha, linha_index|
      next if @galaxia.size == linha_index + 1

      @galaxia[linha_index] = linha.unshift(linha.pop) if @direcao_movimento_monstro.positive?
      if @direcao_movimento_monstro.negative?
        @galaxia[linha_index] = (linha << linha.shift)
      end
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
