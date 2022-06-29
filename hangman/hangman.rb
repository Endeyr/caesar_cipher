# OOB and working with files

require 'yaml'
require './player'
require './secret_word'
require './serialize'

class Game
  include Serialize
  attr_accessor :word, :player, :display, :life

  def initialize
    @word = SecretWord.new
    @player = Player.new
    @display = ''
    @life = 8
    load_or_new
  end

  def load_or_new
    puts 'Enter "1" for a new game or "2" to load a saved game.'
    input = gets.chomp
    if input == '1'
      @word.select_word
      play_game
    else 
      load_game
      puts @display.join(' ')
      play_game
    end
  end

  def make_display
    if @display == ''
      length = word.choice.strip!.length
      @display = Array.new(length, '_')
      puts "\nA secret word awaits.\n"
      puts @display.join(' ')
      puts "\n"
    else
      false
    end
  end

  def save_game
    if player.guess == 'save'
      puts 'Enter a file name (no spaces).'
      filename = gets.chomp
      to_yaml(filename)
    end
  end

  def match
    return false if @player.guess == 'save'

    if @word.choice.include?(@player.guess)
      word_array = @word.choice.split(//)
      word_array.each_with_index do |letter, index|
        @display[index] = letter if letter == @player.guess
      end
      puts "\n'#{@player.guess}' is in the word."
      puts "\n"
      puts @display.join(' ')
      puts "\n"
    else
      miss
    end
  end

  def miss
    player.misses << @player.guess
    puts "\n'#{@player.guess}' is not in the word."
    puts "Misses: #{@player.misses.join(', ')}\n"
    @life -= 1
    puts @display.join(' ')
    puts "\n"
  end

  def check_winner
    if @display == @word.choice.split(//)
      puts "Congrats! you win.\n"
      @life = 0
    elsif @life.zero?
      puts "Unlucky! The word was '#{@word.choice}'."
    end
  end

  def replay
    puts 'Enter "y" to play again.'
    response = gets.chomp.downcase
    if response == 'y'
      new_game
    else
      puts 'Thanks for playing!'
    end
  end

  def new_game
    new = Game.new
    new.play_game
  end

  def play_game
    make_display
    until @life.zero?
      puts "Life left: #{@life}"
      @player.player_input
      save_game
      match
      check_winner
    end
    replay
  end
end

puts 'Welcome to hangman. You get 8 attempts to guess the word.'
Game.new
