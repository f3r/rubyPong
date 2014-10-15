class Paddle
  WIDTH  = 13
  HEIGHT = 100
  SPEED = 6

  attr_reader :side, :y

  def initialize(side)
    @side = side
    @y = Pong::HEIGHT/2
  end

  # x1, y1 <----> x2,y2
  # defining the coordinates fot the area to draw the paddle
  def x1
    {left: 0, right:  Pong::WIDTH - WIDTH}[side]
  end

  def y1;  y - HEIGHT/2 ; end # Initial position
  def x2; x1 +  WIDTH   ; end # rectangle width = paddle width of
  def y2; y1 +  HEIGHT  ; end # height of rectangle is the width of the paddle

  def draw(window)
    color = Gosu::Color::WHITE

    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y2, color,
      x2, y1, color
    )
  end

  def up!
    @y -= SPEED

    if y1 < 0
      @y = HEIGHT/2
    end
  end

  def down!
    @y += SPEED

    if y2 > Pong::HEIGHT
      @y = Pong::HEIGHT - HEIGHT/2
    end
  end
end
