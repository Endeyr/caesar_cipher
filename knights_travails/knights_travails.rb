=begin
  psydocode
  build function that shows the shortest possible way to get from one square to another
  by outputting all squares the knight will stop along the way.
  Each square is a nested array.
  use breathe-first search
  create game board and knight
  game board is 8 by 8
  knight moves 2 steps forward, 1 step side
    possible moves (x, y) = [-2, -1], [-2, 1], [-1,, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]
  create tree with all posible moves (without moving off board)
  find shorest path between squares using bfs
  search from children up to parent
=end

class MoveNode
  attr_reader :position, :parent

  TRANSFORMATIONS = [[1, 2], [-2, -1], [-1, 2], [2, -1],
                     [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

  @@history = []

  def initialize(position, parent)
    @position = position
    @parent = parent
    @@history.push(position)
  end

  def children
    TRANSFORMATIONS.map { |t| [@position[0] + t[0], @position[1] + t[1]] }
                   .keep_if { |e| MoveNode.valid?(e) }
                   .reject { |e| @@history.include?(e) }
                   .map { |e| MoveNode.new(e, self) }
  end

  def self.valid?(position)
    position[0].between?(1, 8) && position[1].between?(1, 8)
  end
end

def display_parent(node)
  display_parent(node.parent) unless node.parent.nil?
  p node.position
end

def knight_moves(start_pos, end_position)
  queue = []
  current_node = MoveNode.new(start_pos, nil)
  until current_node.position == end_position
    current_node.children.each { |child| queue.push(child) }
    current_node = queue.shift
  end
  display_parent(current_node)
end

# Example
knight_moves([2, 5], [4, 7])
