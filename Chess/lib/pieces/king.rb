# frozen_string_literal: true

class King < Piece
  include Stepable
  
  def to_s
    color == :black ? "\u2654" : "\u265A"
  end

  def move_dirs
    [
      [0, 1],
      [1, 1],
      [1, 0],
      [0, -1],
      [1, -1],
      [-1, 1],
      [-1, -1],
      [-1, 0]
    ]
  end
end