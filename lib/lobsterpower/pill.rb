require "minigl"
require "lobsterpower/entity"

module LobsterPower
  class Pill
    include Entity

    def initialize(pill_nr, x = 0, y = 0)
      @game_object = MiniGL::GameObject.new x, y, 0, 0, "pill#{pill_nr.to_s}"
    end

    def draw
      @game_object.draw nil, 0.5, 0.5
    end
  end
end
