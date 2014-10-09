class Ball
  SIZE = 16

  attr_reader :x, :y  # coordinates of the center of the ball
  attr_reader :angle, :speed

  def initialize
    @x = Pong::WIDTH/2
    @y = Pong::HEIGHT/2

    @speed = 4    # Pixels per frame

    @angle = rand(120) + 30
    @angle *= -1 if rand > 0.5
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

  def dx; Gosu.offset_x(angle, speed); end
  def dy; Gosu.offset_y(angle, speed); end

  def move!
    @x += dx
    @y += dy

    if @y < 0
      @y = 0
      bounce_off_edge!
    end

    if @y > Pong::HEIGHT
      @y = Pong::HEIGHT
      bounce_off_edge!
    end
  end

  def bounce_off_edge!
    @angle = Gosu.angle(0, 0, dx, -dy)
  end

  def off_left?;  x1 < 0;          end
  def off_right?; x2 > Pong::WIDTH; end

end
