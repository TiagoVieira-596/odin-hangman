def get_game_info(current_game)
  puts current_game.hangman_pics[current_game.mistake_count]
  print 'Wrong guesses: '
  puts current_game.incorrect_letters.join(' ')
  puts 'None' if current_game.incorrect_letters == []
  print 'Secret word: '
  puts current_game.found_letters.join(' ')
end
