require 'dispel'
require './src/game.rb'

# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  jogo = Game.new
  screen.draw "SpaceInv\n\n" + jogo.tela + "\n~~~~~~~~~"

  Dispel::Keyboard.output timeout: 0.2 do |key|
    next          unless key

    exit(true)    if key == :"Ctrl+c"
    jogo.direita  if key == :right
    jogo.esquerda if key == :left
    jogo.tiro     if key == ' '
    next          if key == :timeout

    jogo.tick
    screen.draw "SpaceInv\n\n" + jogo.tela + "\n~~~~~~~~~"
  end
end
