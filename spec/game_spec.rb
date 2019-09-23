require './src/game'

RSpec.describe Game do
  let!(:game) { Game.new }

  xit 'tela inicial' do
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
end
