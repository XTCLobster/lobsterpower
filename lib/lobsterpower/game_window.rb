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
      @velocity = 10.0
    end

    # Hide mouse cursor when hovering over the game window
    def needs_cursor?
      false
    end

    def update
      MiniGL::KB.update
      @y -= @velocity if MiniGL::KB.key_down? Gosu::KbUp
      @x += @velocity if MiniGL::KB.key_down? Gosu::KbRight
      @y += @velocity if MiniGL::KB.key_down? Gosu::KbDown
      @x -= @velocity if MiniGL::KB.key_down? Gosu::KbLeft
      exit if MiniGL::KB.key_pressed? Gosu::KbEscape
    end

    def draw
      @lobster.draw @x, @y, 0, 0.3, 0.3
    end
  end
end
