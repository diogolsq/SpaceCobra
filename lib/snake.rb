class Snake
  attr_accessor :x, :y, :completesnake, :rabo
  def initialize(tile, width, height)
    @x = 10
    @y = 10
    @tile = tile
    @width = width
    @height = height
    @width_in_tile = width / tile
    @height_in_tile = height / tile
    @speedx = 0
    @speedy = 0
    @rabo = 2
    @completesnake = []
  end

  def update
    @x += @speedx
    @y += @speedy

    @x = 0 if @x > @width_in_tile
    @x = @width_in_tile if @x < 0
    @y = 0 if @y > @height_in_tile
    @y = @height_in_tile if @y < 0

    @completesnake << [@x, @y]

    @completesnake.shift until @completesnake.size <= @rabo
  end

  def draw
    @completesnake.each do |x, y|
      Gosu.draw_rect(x * @tile,
        y * @tile,
        @tile -1,
        @tile -1,
        Gosu::Color::WHITE)
    end
  end


  def grow
    @rabo += 1
  end

  def go_up
  @speedx = 0
  @speedy = -1
  end

  def go_down
  @speedx = 0
  @speedy = 1
  end


  def go_left
  @speedx = -1
  @speedy = 0
  end


  def go_right
  @speedx = 1
  @speedy = 0
  end

  def dead
    @rabo = 2
  end
end
