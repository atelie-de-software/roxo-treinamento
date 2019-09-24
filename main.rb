require 'ruby2d'
require './src/game.rb'

jogo = Game.new
set width: 800, height: 800, background: '#000000'

tick = 0

update do
  system "clear"
  jogo.tick
  tela = jogo.tela
  puts tela
  Image.new('images/monster.jpg', x: 0, y: 0, width: 50, height: 50)
  Image.new('images/tiro.jpg', x: 50, y: 0, width: 50, height: 50)
  sleep 0.2
  tick += 1
end

on :key_down do |event|
  jogo.direita  if event.key == 'right'
  jogo.esquerda if event.key == 'left'
  jogo.tiro     if event.key == 'space'
end

show
