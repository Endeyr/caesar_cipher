# frozen_string_literal: true

# require 'yaml'
require_relative './lib/invalid_move_error'
require_relative './lib/pieces'
require_relative './lib/board_renderer_text'
require_relative './lib/board'
require_relative './lib/player'
require_relative './lib/game'
# require_relative './lib/serialize'

b = Board.start_chess
g = Game.new(
  b,
  Player.new(:white),
  Player.new(:black),
  BoardRendererText
)
g.play
