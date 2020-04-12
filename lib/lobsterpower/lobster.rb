require "minigl"
require "lobsterpower/entity"

module LobsterPower
  class Lobster
    include Entity

    IMAGE_SIZE = [520, 520]
    TARGET_SIZE = [100, 100]

    def initialize(x = 0, y = 0)
      @game_object = MiniGL::GameObject.new x, y, TARGET_SIZE[0], TARGET_SIZE[1], :lobster
      # Compute the drawing scales in X and Y direction: 100/520 = 0.1923
      @scales = IMAGE_SIZE.zip(TARGET_SIZE)
        .map { |rel| rel[1].to_f / rel[0].to_f }
    end

    def draw
      @game_object.draw nil, @scales[0], @scales[1]
    end
  end
end