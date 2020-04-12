require "minigl"
require "lobsterpower/lobster"
require "lobsterpower/pill"

module LobsterPower
  class GameWindow < MiniGL::GameWindow
    def initialize(window_size, asset_path)
      width, height = window_size
      super width, height, false

      MiniGL::Res.prefix = asset_path
      MiniGL::Res.img_dir = "images"

      x, y = 0, 0
      @background = MiniGL::Res.img :background, true, true
      @lobster = Lobster.new(x, y)
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
      @velocity = 5.0
    end

    # Hide mouse cursor when hovering over the game window
    def needs_cursor?
      false
    end

    def update
      update_input
      update_pill_intake
    end

    def draw
      draw_background
      draw_pills
      draw_lobster
    end

    private

      def update_input
        MiniGL::KB.update
        @lobster.y -= @velocity if MiniGL::KB.key_down? Gosu::KbUp
        @lobster.x += @velocity if MiniGL::KB.key_down? Gosu::KbRight
        @lobster.y += @velocity if MiniGL::KB.key_down? Gosu::KbDown
        @lobster.x -= @velocity if MiniGL::KB.key_down? Gosu::KbLeft
        exit if MiniGL::KB.key_pressed? Gosu::KbEscape
      end

      def update_pill_intake
        touched_pills_with_index = @pills.each_with_index.select { |pill, i| pill.touched_by?(@lobster) }

        touched_pills_with_index.reverse.each do |pill, i|
          puts pill
          @pills.delete_at(i)
        end
      end

      def draw_background
        # Amound of steps to tile the background image in order to fill the window
        x_steps = (width.to_f / @background.width.to_f).ceil.to_i
        y_steps = (height.to_f / @background.height.to_f).ceil.to_i

        (0 ... x_steps).each do |x|
          (0 ... y_steps).each do |y|
            @background.draw x * @background.width, y * @background.height, 0
          end
        end
      end

      def draw_pills
        @pills.each do |pill|
          pill.draw
        end
      end

      def draw_lobster
        @lobster.draw
      end
  end
end
