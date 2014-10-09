class Ball
  SIZE = 16

  attr_reader :x, :y  # coordinates of the center of the ball
  attr_reader :angle, :speed

  def initialize
    @x = Pong::WIDTH/2
    @y = Pong::HEIGHT/2

    @angle = 45   # 45 Degrees = up and to the right
    @speed = 4    # Pixels per frame
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

  def move!
    dx = Gosu.offset_x(angle, speed) # http://www.libgosu.org/rdoc/Gosu.html#offset_x-class_method
    dy = Gosu.offset_y(angle, speed) # http://www.libgosu.org/rdoc/Gosu.html#offset_y-class_method

    @x += dx
    @y += dy

    if @y < 0
      @y = 0
      @angle = Gosu.angle(0, 0, dx, -dy)

      # http://www.libgosu.org/rdoc/Gosu.html#angle-class_method
    end
  end
end
