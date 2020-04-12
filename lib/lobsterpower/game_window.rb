require "minigl"

module LobsterPower
  class GameWindow < MiniGL::GameWindow
    def initialize(window_size, asset_path)
      width, height = window_size
      super width, height, false

      MiniGL::Res.prefix = asset_path
      MiniGL::Res.img_dir = "images"

      @lobster = MiniGL::Res.img :lobster
      @x, @y = 0, 0
    end

    def update
    end

    def draw
      @lobster.draw @x, @y, 0, 0.3, 0.3
    end
  end
end
