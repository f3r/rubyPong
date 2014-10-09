require "hasu"

Hasu.load "ball.rb"

class Pong < Hasu::Window

  WIDTH       = 768
  HEIGHT      = 576

  def initialize
    super(WIDTH, HEIGHT, false) # full-screen = false
  end

  def reset
    @ball = Ball.new

    @left_score  = 0
    @right_score = 0

    @font = Gosu::Font.new(self, "Arial", 30)
  end

  def draw
    @ball.draw(self)

    @font.draw(@left_score,  30,       30, 0) # top-left corner
    @font.draw(@right_score, WIDTH-50, 30, 0) # top-right corner
  end

  def update
    @ball.move!
  end
end

Pong.run
