require 'ruby2d'
require './src/game.rb'

jogo = Game.new
set width: 800, height: 800, background: '#000000'

sprites = {
  'w': 'images/monster.jpg',
  'A': 'images/spaceship.jpg',
  '|': 'images/tiro.jpg',
  ' ': 'images/background.jpg',
  '*': 'images/explosion.jpg'
}

update do
  system "clear"
  clear
  jogo.tick
  tela = jogo.tela
  puts tela

  rows = tela.split("\n")
  rows.each_with_index do |row, y|
    row.each_char.with_index do |char, x|
      Image.new(sprites[char.to_sym], x: (x * 50), y: (y * 50), width: 50, height: 50)
    end
  end
  sleep 0.2
end

on :key_down do |event|
  jogo.direita  if event.key == 'right'
  jogo.esquerda if event.key == 'left'
  jogo.tiro     if event.key == 'space'
end

show
