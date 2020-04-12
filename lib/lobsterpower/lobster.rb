require "minigl"
require "lobsterpower/entity"

module LobsterPower
  class Lobster
    include Entity

    IMAGE_SIZE = [520, 520]
    TARGET_SIZE = [100, 100]

    attr_reader :speed

    def initialize(x = 0, y = 0)
      @speed = 2
      @game_object = MiniGL::GameObject.new x, y, TARGET_SIZE[0], TARGET_SIZE[1], :lobster
      # Compute the drawing scales in X and Y direction: 100/520 = 0.1923
      @scales = IMAGE_SIZE.zip(TARGET_SIZE)
        .map { |rel| rel[1].to_f / rel[0].to_f }
    end

    def draw
      @game_object.draw scale_x: @scales[0], scale_y: @scales[1], round: true
    end

    def bounds
      # Lobster body can be approximated by separating it into vertical thirds
      offset = @game_object.bounds.w / 3
      return MiniGL::Rectangle.new \
        @game_object.bounds.x + offset, @game_object.bounds.y,
        @game_object.w - 2 * offset,    @game_object.bounds.h
    end

    def increase_pill_power
      @speed *= 1.4
    end
  end
end
