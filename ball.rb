class Ball
  SIZE = 16

  attr_reader :x, :y  # coordinates of the center of the ball

  def initialize
    @x = Pong::WIDTH/2
    @y = Pong::HEIGHT/2
  end

  # Coordinates to define the area of the ball (as a square)
  def x2; @x + SIZE/2; end
  def y2; @y + SIZE/2; end
  def y1; @y - SIZE/2; end
  def x1; @x - SIZE/2; end

  def draw(window)
    color = Gosu::Color::RED

    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y2, color,
      x2, y1, color
    )

    # http://www.libgosu.org/rdoc/Gosu/Color.html
    # http://www.libgosu.org/rdoc/Gosu/Window.html#draw_quad-instance_method
  end
end