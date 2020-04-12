require "gosu"

class Gosu::Image
  def draw_tiled(x, y, fill_width, fill_height)
    # Amound of steps to tile the background image in order to fill
    # the requirements. Will over-draw.
    x_steps = (fill_width.to_f / width.to_f).ceil.to_i
    y_steps = (fill_height.to_f / height.to_f).ceil.to_i

    (0 ... x_steps).each do |x|
      (0 ... y_steps).each do |y|
        draw x * width, y * height, 0
      end
    end
  end
end