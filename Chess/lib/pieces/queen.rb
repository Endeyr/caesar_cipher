# frozen_string_literal: true

class Queen < Piece
  include Slideable
  
  def to_s
    color == :black ? "\u2655" : "\u265B"
  end

  def move_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
      [0, 1], 
      [0, -1],
      [1, 0],
      [-1, 0]
    ]
  end
end
