require "lobsterpower/version"
require "lobsterpower/game_window"

module LobsterPower
  WINDOW_SIZE = [640, 480]

  class << self
    def run(asset_path)
      @window = LobsterPower::GameWindow.new(WINDOW_SIZE, asset_path)
      @window.show
    end
  end
end
