def get_user_guess(current_game)
  player_guess = nil
  until !player_guess.nil? && !player_guess.empty? && player_guess != '\n' && (97..122).include?(player_guess.ord) &&
        player_guess.length == 1 && !current_game.incorrect_letters.include?(player_guess) &&
        !current_game.found_letters.include?(player_guess)
    print 'Guess a letter: '
    player_guess = gets.chomp.downcase
  end
  player_guess
end

def yes_or_no?(message)
  user_choice = nil
  while user_choice.nil?
    print message
    user_response = gets.chomp.downcase
    user_choice = true if %w[y yes].include?(user_response)
    user_choice = false if %w[n no].include?(user_response)
  end
  user_choice
end
