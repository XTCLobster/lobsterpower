require "minigl"
require "lobsterpower/lobster"
require "lobsterpower/pill"
require "lobsterpower/ext/gosu/image_tiled"

module LobsterPower
  class GameWindow < MiniGL::GameWindow
    Z_SCORE = 999

    def initialize(window_size, asset_path)
      width, height = window_size
      super width, height, false

      MiniGL::Res.prefix = asset_path
      MiniGL::Res.img_dir = "images"
      MiniGL::Res.font_dir = "fonts"

      x, y = 0, 0
      @font = MiniGL::Res.font :spicyrice, 48
      @background = MiniGL::Res.img :background, true, true
      @lobster = Lobster.new(x, y)
      @score = 0
      @pills = [
        Pill.new(1, 100, 100),
        Pill.new(2, 200, 200),
        Pill.new(3, 400, 300),
        Pill.new(4, 200, 500),
        Pill.new(5, 500, 200),
        Pill.new(6, 300, 400),
        Pill.new(1, 50, 300),
        Pill.new(2, 500, 300),
      ]
    end

    # Hide mouse cursor when hovering over the game window
    def needs_cursor?
      false
    end

    def update
      update_input
      update_animations
      update_pill_intake
    end

    def draw
      draw_background
      draw_pills
      draw_lobster
      draw_score
    end

    private

      def update_input
        MiniGL::KB.update

        speed = @lobster.speed
        @lobster.y -= speed if MiniGL::KB.key_down? Gosu::KbUp
        @lobster.x += speed if MiniGL::KB.key_down? Gosu::KbRight
        @lobster.y += speed if MiniGL::KB.key_down? Gosu::KbDown
        @lobster.x -= speed if MiniGL::KB.key_down? Gosu::KbLeft

        exit if MiniGL::KB.key_pressed? Gosu::KbEscape
      end

      def update_animations
        @pills.each do |pill|
          pill.update
        end
      end

      def update_pill_intake
        touched_pills_with_index = @pills.each_with_index.select { |pill, i| pill.touched_by?(@lobster) }

        touched_pills_with_index.reverse.each do |pill, i|
          @pills.delete_at(i)
          @lobster.increase_pill_power
          @score = [357, (@score * 13.37).to_i].max
        end
      end

      def draw_background
        @background.draw_tiled 0, 0, width, height
      end

      def draw_pills
        @pills.each do |pill|
          pill.draw
        end
      end

      def draw_lobster
        @lobster.draw
      end

      def draw_score
        x, y = 9, 9
        scale_x, scale_y = 1.0, 1.0
        glow_color = 0xa0_2F9ED6
        text_color = 0xff_ffffff
        font = @font
        text = "Score: " + @score.to_s.rjust(9, "0")
        font.draw_text text, x-2, y-2, Z_SCORE, scale_x, scale_y, glow_color
        font.draw_text text, x+2, y-2, Z_SCORE, scale_x, scale_y, glow_color
        font.draw_text text, x-2, y+2, Z_SCORE, scale_x, scale_y, glow_color
        font.draw_text text, x+2, y+2, Z_SCORE, scale_x, scale_y, glow_color
        font.draw_text text, x,   y,   Z_SCORE, scale_x, scale_y, text_color
      end
  end
end
