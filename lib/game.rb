require 'Gosu'
require_relative 'snake.rb'
require_relative 'food.rb'
require_relative 'gameover.rb'

module ZOrder
  BACKGROUND, STARS, PLAYER, UI = *0..3
end

class SpaceCobra < Gosu::Window
  attr_accessor :tile
  def initialize
    @fullscreen = false
    @gamespeed = (1000 / 15)
    @width = 640
    @height = 480
    @tile = 10
    super(@width, @height, @fullscreen, @gamespeed)
    @background_image = Gosu::Image.new('spacebackground.png', :tileable => true)
    self.caption = "Space Cobra"
    @snake = Snake.new(@tile, @width, @height)
    @food = Food.new(@tile, @width, @height)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    if @snake.x == @food.x && @snake.y == @food.y
      @snake.grow
      @eatbeep = Gosu::Sample.new("eat.wav")
      @eatbeep.play
      @food.respawn
    end
    @snake.update
    @food.update
  end

  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)

    @snake.completesnake[0..-2].each do |x, y|
      if (x == @snake.x) && (y == @snake.y)
        @font.draw("NewGame", 40, 40, ZOrder::UI, 5, 5, Gosu::Color::YELLOW)
        @start = Gosu::Sample.new("start.wav")
        @start.play
        @snake.rabo = 2
        break
      else
        @snake.draw
        @food.draw
      end
    end
  end

  def button_down(id)
    case id
    when Gosu::KbUp then @snake.go_up
    when Gosu::KbDown then @snake.go_down
    when Gosu::KbLeft then @snake.go_left
    when Gosu::KbRight then @snake.go_right
    end
  end
end

File.foreach('art2.txt') do |line|
  puts "#{line}"
end


sleep(3)

SpaceCobra.new.show
