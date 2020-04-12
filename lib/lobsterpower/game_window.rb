require "minigl"
require "lobsterpower/lobster"

module LobsterPower
  class GameWindow < MiniGL::GameWindow
    def initialize(window_size, asset_path)
      width, height = window_size
      super width, height, false

      MiniGL::Res.prefix = asset_path
      MiniGL::Res.img_dir = "images"

      x, y = 0, 0
      @lobster = Lobster.new(x, y)
      @velocity = 5.0
    end

    # Hide mouse cursor when hovering over the game window
    def needs_cursor?
      false
    end

    def update
      MiniGL::KB.update
      @lobster.y -= @velocity if MiniGL::KB.key_down? Gosu::KbUp
      @lobster.x += @velocity if MiniGL::KB.key_down? Gosu::KbRight
      @lobster.y += @velocity if MiniGL::KB.key_down? Gosu::KbDown
      @lobster.x -= @velocity if MiniGL::KB.key_down? Gosu::KbLeft
      exit if MiniGL::KB.key_pressed? Gosu::KbEscape
    end

    def draw
      @lobster.draw
    end
  end
end
