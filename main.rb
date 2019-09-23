require 'dispel'
require './src/game.rb'

x = 0
output = ''
space = false

# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    next unless key

    exit(true) if key == :"Ctrl+c"

    x += 1 if key == :right
    x -= 1 if key == :left
    space = true if key == ' '

    next if key == :timeout

    output = Game.new.tela
    screen.draw output
    space = false
  end
end
