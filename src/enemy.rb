class Enemy
  attr :alive

  def initialize(alive)
    @alive = alive
  end

  def alive?
    @alive
  end

  def show
    'W'
  end
end
