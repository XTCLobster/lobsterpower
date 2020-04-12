require "minigl"
require "lobsterpower/entity"
require "lobsterpower/wobble_animation"

module LobsterPower
  class Pill
    include Entity

    def initialize(pill_nr, x = 0, y = 0)
      @game_object = MiniGL::GameObject.new x, y, 0, 0, "pill#{pill_nr.to_s}", MiniGL::Vector.new(-10, -5)
      @rotation = 0.0
      @wobble = WobbleAnimation.new
    end

    def update
      @wobble.update
      @rotation = @wobble.value
    end

    def draw
      @game_object.draw scale_x: 0.5, scale_y: 0.5, angle: @rotation.to_i, round: true
    end
  end
end
