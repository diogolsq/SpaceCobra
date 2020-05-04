class Food
  attr_accessor :x, :y
  def initialize(tile, width, height)
    @x = 15
    @y = 15
    @tile = tile
    @width = width
    @height = height
  end

  def update
  end

  def draw
    Gosu.draw_rect(@x * @tile,
      @y * @tile,
      @tile - 1,
      @tile - 1,
      Gosu::Color::RED)
  end


  def respawn
    @x = (rand * @tile).floor
    @y = (rand * @tile).floor
  end
end
