require "lobsterpower/version"

module LobsterPower
  class << self
    def run(game_dir)
      raise "Expected game_dir" unless game_dir
    end
  end
end
