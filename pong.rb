require "hasu"

Hasu.load "ball.rb"
Hasu.load "paddle.rb"

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

    @left_paddle  = Paddle.new(:left)
    @right_paddle = Paddle.new(:right)

  end

  def draw
    @ball.draw(self)

    @font.draw(@left_score,  30,       30, 0) # top-left corner
    @font.draw(@right_score, WIDTH-50, 30, 0) # top-right corner

    @left_paddle.draw(self)
    @right_paddle.draw(self)
  end

  def update
    @ball.move!

    move_paddle_if_keypress
    check_off_bounces
  end

  def move_paddle_if_keypress
    @left_paddle.up!    if button_down?(Gosu::KbW)    # Keyboard key: W
    @left_paddle.down!  if button_down?(Gosu::KbS)    # Keyboard key: S
    @right_paddle.up!   if button_down?(Gosu::KbUp)   # Keyboard key: Up
    @right_paddle.down! if button_down?(Gosu::KbDown) # Keyboard key: Down
  end

  def check_off_bounces
    if @ball.off_left?
      @left_score += 1
      @ball = Ball.new
    end

    if @ball.off_right?
      @right_score += 1
      @ball = Ball.new
    end
  end
end

Pong.run
