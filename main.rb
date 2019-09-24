require 'dispel'
require './src/game.rb'

# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  jogo = Game.new

  Dispel::Keyboard.output timeout: 0.2 do |key|
    jogo.tick
    screen.draw "SpaceInv\n\n" + jogo.tela + "\n~~~~~~~~~"

    next          unless key

    exit(true)    if key == :"Ctrl+c"
    jogo.direita  if key == :right
    jogo.esquerda if key == :left
    jogo.tiro     if key == ' '
  end
end
