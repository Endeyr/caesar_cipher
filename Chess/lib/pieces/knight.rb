# frozen_string_literal: true

class Knight < Piece
  include Stepable
  
  def to_s
    color == :black ? "\u2658" : "\u265E"
  end

  def move_dirs
    [
      [1, 2],
      [2, 1],
      [-1, 2],
      [-2, 1],
      [1, -2],
      [2, -1],
      [-1, -2],
      [-2, -1]
    ]
  end
end