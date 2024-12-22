require_relative 'game'
require_relative 'user_input'
require_relative 'get_game_info'
current_game = Game.new
Game.from_json(File.read('saves.json'), current_game) if yes_or_no?('Load saved game? ')
game_won = false
until game_won == true || current_game.mistake_count >= 6
  get_game_info(current_game)
  current_game.to_json if yes_or_no?('Save game? ')
  player_guess = get_user_guess(current_game)
  current_game.guess(player_guess)
  game_won = true if current_game.found_letters.join('') == current_game.secret_word
end

get_game_info(current_game)
if game_won == false
  puts 'You ran out of guesses, game lost.'
  print 'The secret world was: '
  puts current_game.secret_word
end
puts "You've guessed the word!!!" if game_won == true
