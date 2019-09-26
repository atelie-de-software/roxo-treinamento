require 'ruby2d'
require './src/game.rb'

SPRITES = {
  'w':      'images/monster.jpg',
  'A':      'images/spaceship.jpg',
  '|':      'images/tiro.jpg',
  ' ':      'images/background.jpg',
  '*':      'images/explosion.jpg',
  'WINNER': 'images/winner.png'
}

SPRITE_TAMANHO = 50
QUANTIDADE_COLUNAS = 12
QUANTIDADE_LINHAS = 10

TELA_LARGURA = QUANTIDADE_COLUNAS * SPRITE_TAMANHO
TELA_ALTURA = QUANTIDADE_LINHAS * SPRITE_TAMANHO

COR_PLANO_FUNDO = '#000000'

FPS = 5
TEMPO_TICK = 1.0/FPS

set width: TELA_LARGURA, height: TELA_ALTURA, background: COR_PLANO_FUNDO

background = Music.new('musics/background.midi')
background.loop = true
background.volume = 30
background.play

tiro_audio = Sound.new('musics/tiro.wav')
boom_audio = Sound.new('musics/boom.wav')

jogo = Game.new

update do
  jogo.tick

  tela = jogo.tela

  renderizar_grafico tela
  renderizar_texto tela

  boom_audio.play if tela.count('*').positive?

  sleep TEMPO_TICK
end

on :key_down do |event|
  jogo.direita  if event.key == 'right'
  jogo.esquerda if event.key == 'left'
  if event.key == 'space'
    jogo.tiro
    tiro_audio.play
  end
end

def renderizar_grafico tela
  clear
  linhas = tela.split("\n")
  linhas.each_with_index do |linha, y_index|
    linha.each_char.with_index do |codigo_sprite, x_index|
      renderiza_sprite(codigo_sprite.to_sym, x_index, y_index)
    end
  end
end

def renderiza_sprite codigo_sprite, x_index, y_index
  caminho_sprite = SPRITES[codigo_sprite]
  x_posicao = (x_index * SPRITE_TAMANHO)
  y_posicao = (y_index * SPRITE_TAMANHO)

  Image.new(caminho_sprite, x: x_posicao, y: y_posicao, width: SPRITE_TAMANHO, height: SPRITE_TAMANHO)
end

def renderizar_texto tela
  system "clear"
  puts tela
end

show
