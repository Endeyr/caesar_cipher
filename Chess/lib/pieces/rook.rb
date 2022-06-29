# frozen_string_literal: true

class Rook < Piece
  include Slideable
  
  def to_s
    color == :black ? "\u2656" : "\u265C"
  end

  def move_dirs
    [
      [0, 1], 
      [0, -1],
      [1, 0],
      [-1, 0]
    ]
  end
end