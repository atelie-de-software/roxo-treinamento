require './src/game'

RSpec.describe Game do
  let!(:game) { Game.new }

  it 'tela inicial' do
    tela_inicial =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A           "

    expect(game.tela).to eq tela_inicial
  end

  it 'mover para a direita' do
    game.direita

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

    expect(game.tela).to eq tela_esperada
  end

  xit 'mover duas vezes para a direita' do
    game.direita
    game.direita

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

    expect(game.tela).to eq tela_esperada
  end

  xit 'mover duas vezes para a direita e uma vez para a esquerda' do
    game.direita
    game.direita
    game.esquerda

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

    expect(game.tela).to eq tela_esperada
  end

  xit 'mover uma vez para a esquerda' do
    game.esquerda

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

    expect(game.tela).to eq tela_esperada
  end

  xit 'nave da um tiro' do
    game.tiro

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "|           \n" +
      "A            "
    expect(game.tela).to eq tela_esperada
  end

  xit 'anda para a direita e da um tiro' do
    game.direita
    game.tiro

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "            \n" +
      "            \n" +
      "  |         \n" +
      "  A         "

    expect(game.tela).to eq tela_esperada
  end

  xit 'tiro e um tick' do
    game.tiro

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

    expect(game.tela).to eq tela_esperada

    game.tick

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

    expect(game.tela).to eq tela_esperada
  end

  xit 'tiro e dois ticks' do
    game.tiro

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

    expect(game.tela).to eq tela_esperada

    game.tick

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

    expect(game.tela).to eq tela_esperada

    game.tick

    tela_esperada =
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "w w w w     \n" +
      "|           \n" +
      "            \n" +
      "            \n" +
      "A           "

    expect(game.tela).to eq tela_esperada
  end

  xit 'tiro acertando o inimigo' do
    game.tiro
    game.tick
    game.tick
    game.tick

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

    expect(game.tela).to eq tela_esperada
  end

  xit 'inimigo destruido' do
    game.tiro
    game.tick
    game.tick
    game.tick
    game.tick

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

    expect(game.tela).to eq tela_esperada
  end
end
