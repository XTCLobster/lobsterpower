require "minigl"

module LobsterPower
  class GameWindow < MiniGL::GameWindow
    def initialize(window_size)
      width, height = window_size
      super width, height, false
    end

    def update
      # this method is called for every update in the game logics
      # as events, positions, status variables,  calculations, etc.
    end

    def draw
      # this method is called after updates for refreshing the game graphics
    end
  end
end
