require "forwardable"

module LobsterPower
  # Instead of making Lobster and Pills inherit from MiniGL::GameObject and
  # expose all kinds of methods, we make them a wrapper around
  # GameObject instead.  That keeps the API simple for us.
  module Entity
    # Forward getter/setter of positions to the hidden game object
    # to move the lobster.
    extend Forwardable
    def_delegators :@game_object, :x, :y, :x=, :y=
  end
end