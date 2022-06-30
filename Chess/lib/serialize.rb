module Serialize
  def load_game
    if File.exist?('./saved_games')
      puts "Saved files: #{Dir.children('./saved_games').join(' ')}"
      puts 'Enter one of the filenames "filename.yml"'
      filename = gets.chomp
      from_yaml(filename)
    else
      puts 'There are no files to load. You have to play a new game.'
      load_or_new
    end
  end

  def to_yaml(filename)
    Dir.mkdir('saved_games') unless File.exist?('saved_games')
    f = File.open("saved_games/#{filename}.yml", 'w')
    YAML.dump({
                board: @board
              }, f)
    f.close
    puts "\nGAME SAVED"
  end

  def from_yaml(filename)
    f = YAML.safe_load(File.read("./saved_games/#{filename}"))
    @board = f[:board]
  end
end