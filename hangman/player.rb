class Player
  attr_accessor :guess, :misses, :guess_history

  def initialize
    @guess = ''
    @misses = []
    @guess_history = []
  end

  def player_input
    puts "Enter your guess (one letter a - z), or 'save' to save."
    input = gets.chomp.downcase
    if input == 'save'
      @guess = input
    else
      validate_input(input)
    end
  end

  def validate_input(input = '')
    until input.length == 1 && input =~ /[a-z]/
      puts "\nEnter a valid guess (one letter a - z)."
      input = gets.chomp.downcase
    end
    @guess = input
    check_history(input)
    @guess_history << @guess
  end

  def check_history(input)
    if @guess_history.include?(input)
      puts "You've already tried that one!"
      validate_input
    else
      false
    end
  end
end
