class Paddle
  WIDTH  = 13
  HEIGHT = 100

  attr_reader :side, :y

  def initialize(side)
    @side = side
    @y = Pong::HEIGHT/2
  end

  # x1, y1 <----> x2,y2
  # defining the coordinates fot the area to draw the paddle
  def x1
    case side
    when :left;  0
    when :right; Pong::WIDTH - WIDTH
    end
  end

  def y1;  y - HEIGHT/2 ; end
  def x2; x1 +  WIDTH   ; end # width of rectangle is the width of the paddle
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
end
