require './src/game'

RSpec.describe Game do
  let!(:game) { Game.new }

  it 'tela inicial' do
    tela_inicial =
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "A            "

    expect(game.tela).to eq tela_inicial
  end

  xit 'mover para a direita' do
    game.direita

    tela_esperada =
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "  A          "

    expect(game.tela).to eq tela_esperada
  end

  xit 'mover duas vezes para a direita' do
    game.direita
    game.direita

    tela_esperada =
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "w w w w w w \n" +
      "            \n" +
      "            \n" +
      "            \n" +
      "    A        "

    expect(game.tela).to eq tela_esperada
  end
end
