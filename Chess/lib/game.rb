# frozen_string_literal: true

require 'yaml'
require_relative './serialize'

class Game
  include Serialize
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player

  def initialize(board, player1, player2, renderer_class)
    @board = board
    @renderer = renderer_class.new(board)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    load_or_new
    until over?
      renderer.render
      puts "It's #{current_player.color}'s turn"
      if board.in_check?(current_player.color)
        puts "#{current_player.color} are in check"
      end
      take_turn
      swap_player!
    end
    swap_player!
    puts "Game over! The winner is: #{current_player.color}"
    renderer.render
  end

  def over?
    board.checkmate?(current_player.color)
  end

  def take_turn
    start_pos = nil

    puts 'Answer q to quit, s to save, any to continue.'
    answer = gets.chomp
    if answer == 'q'
      quit_game
    elsif answer == 's'
      save_game
      quit_game
    else
      loop do
        puts 'Select a piece to move: '
        start_pos = current_player.position
        break if board[start_pos].color == current_player.color

        puts "Did not select a #{current_player.color} piece"
      end
    end

    loop do
      puts 'Select a position to move to: '
      end_pos = current_player.position

      begin
        board.move_piece(start_pos, end_pos)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end

  def quit_game
    exit
    p 'Thank you for playing!'
  end

  def save_game
    puts 'Enter a file name (no spaces).'
    filename = gets.chomp
    to_yaml(filename)
  end

  def load_or_new
    puts 'Enter "1" for a new game or "2" to load a saved game.'
    input = gets.chomp
    if input == '1'
      return
    else
      load_game
      return
    end
  end
end
