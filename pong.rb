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

    @left_paddle  = Paddle.new(:left, true)
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

    if @ball.intersect?(@left_paddle)
      @ball.bounce_off_paddle!(@left_paddle)
    end

    if @ball.intersect?(@right_paddle)
      @ball.bounce_off_paddle!(@right_paddle)
    end
  end

  def move_paddle_if_keypress
    if @left_paddle.ai
      @left_paddle.ai_move!(@ball)
    else
      @left_paddle.up!    if button_down?(Gosu::KbW)    # Keyboard key: W
      @left_paddle.down!  if button_down?(Gosu::KbS)    # Keyboard key: S
    end

    if @right_paddle.ai
      @right_paddle.ai_move!(@ball)
    else
      @right_paddle.up!   if button_down?(Gosu::KbUp)   # Keyboard key: Up
      @right_paddle.down! if button_down?(Gosu::KbDown) # Keyboard key: Down
    end
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

  def button_down(button)
    close if button == Gosu::KbEscape
  end
end

Pong.run
