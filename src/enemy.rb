class Enemy
  attr :alive

  def initialize(alive)
    @alive = alive
  end

  def alive?
    @alive
  end

  def show
    alive? ? 'W' : ' '
  end
end
