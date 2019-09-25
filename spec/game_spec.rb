require './src/game'

def tela(*esperada)
  expect(jogo.tela).to eq esperada.join("\n")
end

def direita
  jogo.direita
end

RSpec.describe Game do
  let!(:jogo) { Game.new }

  it 'tela inicial' do
    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "            ",
         "            ",
         "A           "
  end

  context 'move para a direita' do
    before do
      direita
    end

    it 'mover para a direita' do
      tela_esperada =
        "w w w w     \n" +
        "w w w w     \n" +
        "w w w w     \n" +
        "w w w w     \n" +
        "w w w w     \n" +
        "            \n" +
        "            \n" +
        "            \n" +
        "  A         "

      expect(jogo.tela).to eq tela_esperada
    end

    it 'mover duas vezes para a direita' do
      direita

      tela_esperada =
        "w w w w     \n" +
        "w w w w     \n" +
        "w w w w     \n" +
        "w w w w     \n" +
        "w w w w     \n" +
        "            \n" +
        "            \n" +
        "            \n" +
        "    A       "

      expect(jogo.tela).to eq tela_esperada
    end
  end

  it 'mover duas vezes para a direita e uma vez para a esquerda' do
    jogo.direita
    jogo.direita
    jogo.esquerda

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "  A         "

    expect(jogo.tela).to eq tela_esperada
  end

  it 'mover uma vez para a esquerda' do
    jogo.esquerda

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada
  end

  it 'nave da um tiro' do
    jogo.tiro

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A           "
    expect(jogo.tela).to eq tela_esperada
  end

  it 'anda para a direita e da um tiro' do
    jogo.direita
    jogo.tiro

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "  A         "

    expect(jogo.tela).to eq tela_esperada
  end

  it 'tiro e um tick' do
    jogo.tiro

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada

    jogo.tick

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "|           \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada
  end

  it 'tiro e dois ticks' do
    jogo.tiro

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada

    jogo.tick

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "|           \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada

    jogo.tick

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "|           \n" +
      "            \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada
  end

  it 'tiro acertando o inimigo' do
    jogo.tiro
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "* w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada
  end

  xit 'inimigo destruido' do
    jogo.tiro
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "  w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada
  end

  xit 'destroi o inimigo e anda para a direita' do
    jogo.tiro
    jogo.tick
    jogo.direita
    jogo.tick
    jogo.direita
    jogo.tick
    jogo.tick
    jogo.tick

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "  w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "    A       "

    expect(jogo.tela).to eq tela_esperada
  end

  xit 'atira e anda para a direita' do
    jogo.tiro
    jogo.tick
    jogo.direita

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "|           \n" +
      "  A         "

    expect(jogo.tela).to eq tela_esperada
  end

  xit 'atira e anda para a direita' do
    jogo.tiro
    jogo.tick
    jogo.direita
    jogo.tick
    jogo.tick
    jogo.tick

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "* w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "  A         "

    expect(jogo.tela).to eq tela_esperada
  end

  xit 'atira, mata o inimigo e os outros inimigos começam a se mover para a direita' do
    jogo.tiro
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick

    tela_esperada =
      "  w w w w   \n" +
      "  w w w w   \n" +
      "  w w w w   \n" +
      "  w w w w   \n" +
      "    w w w   \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A           "

    expect(jogo.tela).to eq tela_esperada
  end

end
