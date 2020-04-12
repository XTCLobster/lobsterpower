module LobsterPower
  class WobbleAnimation
    attr_reader :value

    def initialize
      @min = -40
      @max =  40
      @step = @min
      @direction = +1
      @value = @step
    end

    def update
      @step += @direction

      if @step > @max
        @step = @max
        @direction *= -1
      elsif @step < @min
        @step = @min
        @direction *= -1
      end

      @value = @step.to_f
    end
  end
end
