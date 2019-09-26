require './src/game'

def tela(*esperada)
  expect(jogo.tela).to eq esperada.join("\n")
end

def direita(vezes = 1)
  vezes.times { jogo.direita }
end

def esquerda(vezes = 1)
  vezes.times { jogo.esquerda }
end

def tick(vezes = 1)
  vezes.times { jogo.tick }
end

def password
  2.times { jogo.tiro }
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

    it 'mover para a direita' do
      direita
      tela  "w w w w     ",
            "w w w w     ",
            "w w w w     ",
            "w w w w     ",
            "w w w w     ",
            "            ",
            "            ",
            "            ",
            "  A         "
    end

    it 'mover duas vezes para a direita' do
      direita 2

      tela "w w w w     ",
           "w w w w     ",
           "w w w w     ",
           "w w w w     ",
           "w w w w     ",
           "            ",
           "            ",
           "            ",
           "    A       "
    end
  end

  it 'mover duas vezes para a direita e uma vez para a esquerda' do
    direita 2
    esquerda

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "            ",
         "            ",
         "  A         "
  end

  it 'mover uma vez para a esquerda' do
    esquerda

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

  it 'nave da um tiro' do
    jogo.tiro

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

  it 'anda para a direita e da um tiro' do
    direita
    jogo.tiro

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "            ",
         "            ",
         "  A         "
  end

  it 'tiro e um tick' do
    jogo.tiro

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "            ",
         "            ",
         "A           "

    tick

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "            ",
         "|           ",
         "A           "
  end

  it 'tiro e dois ticks' do
    jogo.tiro

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "            ",
         "            ",
         "A           "

    tick

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "            ",
         "|           ",
         "A           "

    tick

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "|           ",
         "            ",
         "A           "
  end

  it 'tiro acertando o inimigo' do
    jogo.tiro
    tick 4

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "* w w w     ",
         "            ",
         "            ",
         "            ",
         "A           "
  end

  it 'inimigo destruido' do
    jogo.tiro
    tick 5

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "  w w w     ",
         "            ",
         "            ",
         "            ",
         "A           "
  end

  it 'destroi o inimigo e anda para a direita' do
    jogo.tiro
    tick
    direita
    tick
    direita
    tick 3

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "  w w w     ",
         "            ",
         "            ",
         "            ",
         "    A       "
  end

  it 'atira e anda para a direita' do
    jogo.tiro
    tick
    direita

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "            ",
         "|           ",
         "  A         "
  end

  it 'atira e anda para a direita' do
    jogo.tiro
    tick
    direita
    tick 3

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "* w w w     ",
         "            ",
         "            ",
         "            ",
         "  A         "
  end

  it 'permite apenas um tiro por vez' do
    jogo.tiro
    tick
    jogo.tiro
    tick

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "            ",
         "|           ",
         "            ",
         "A           "
  end

  it 'permite apenas um tiro enquanto não limpar a tela' do
    jogo.tiro
    tick 3
    jogo.tiro
    tick

    tela "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "* w w w     ",
         "            ",
         "            ",
         "            ",
         "A           "
  end

  it 'atira, mata o inimigo e os outros inimigos começam a se mover para a direita' do
    jogo.tiro
    tick 16

    tela "  w w w w   ",
         "  w w w w   ",
         "  w w w w   ",
         "  w w w w   ",
         "    w w w   ",
         "            ",
         "            ",
         "            ",
         "A           "
  end

  it 'mover para a direita até o limite' do
    jogo.tiro
    tick 26

    tela "    w w w w ",
         "    w w w w ",
         "    w w w w ",
         "    w w w w ",
         "      w w w ",
         "            ",
         "            ",
         "            ",
         "A           "
  end

  xit 'mover para a direita até o limite e descer uma linha' do
    jogo.tiro
    tick 36

    tela "            ",
         "  w w w w   ",
         "  w w w w   ",
         "  w w w w   ",
         "  w w w w   ",
         "    w w w   ",
         "            ",
         "            ",
         "A           "
  end

  xit 'move inimigos para esquerda na linha mesma linha que desceu' do
    jogo.tiro
    tick 46

    tela "            ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "w w w w     ",
         "  w w w     ",
         "            ",
         "            ",
         "A           "
  end

  it 'comando de password para chegar no ultimo inimigo' do
    password

    tela "w           ",
         "            ",
         "            ",
         "            ",
         "            ",
         "            ",
         "            ",
         "            ",
         "A           "
  end

  it 'vitoria quando não existir inimigos' do
    password
    jogo.tiro
    tick 9

    tela "WINNER"
  end
end
