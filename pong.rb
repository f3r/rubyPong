require "hasu"

class Pong < Hasu::Window
  
  WIDTH       = 768
  HEIGHT      = 576

  def initialize
    super(WIDTH, HEIGHT, false) # full-screen = false
  end

end
Pong.run