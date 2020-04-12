require "lobsterpower/version"
require "lobsterpower/game_window"

module LobsterPower
  WINDOW_SIZE = [640, 480]

  class << self
    def run
      @window = LobsterPower::GameWindow.new(WINDOW_SIZE)
      @window.show
    end
  end
end
