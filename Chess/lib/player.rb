# frozen_string_literal: true

class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def position
    gets.chomp.split(',').map { |part| part.to_i }
  end
end
