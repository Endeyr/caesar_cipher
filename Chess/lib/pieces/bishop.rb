# frozen_string_literal: true

class Bishop < Piece
  include Slideable
  
  def to_s
    color == :black ? "\u2657" : "\u265D"
  end

  def move_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end
end
