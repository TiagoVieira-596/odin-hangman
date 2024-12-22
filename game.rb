require 'json'
class Game
  attr_reader :secret_word, :hangman_pics, :mistake_count, :incorrect_letters, :found_letters

  def initialize
    words = File.open('google-10000-english-no-swears.txt', 'r')
    @secret_word = words.filter { |word| word.length >= 6 && word.length <= 13 }.sample.chomp
    @hangman_pics = File.read('hangmanpics.txt').split(',')
    @mistake_count = 0
    @incorrect_letters = []
    @found_letters = Array.new(@secret_word.length, '_')
  end

  def to_json(*_args)
    JSON.dump({
                secret_word: @secret_word,
                hangman_pics: @hangman_pics,
                mistake_count: @mistake_count,
                incorrect_letters: @incorrect_letters,
                found_letters: @found_letters
              })
  end

  def self.from_json(json_object, current_game_object)
    saved_game_data = JSON.parse(json_object)
    current_game_object.secret_word = saved_game_data['secret_word']
    current_game_object.hangman_pics = saved_game_data['hangman_pics']
    current_game_object.mistake_count = saved_game_data['mistake_count']
    current_game_object.incorrect_letters = saved_game_data['incorrect_letters']
    current_game_object.found_letters = saved_game_data['found_letters']
    File.write('saves.json', current_game_object, mode: 'a')
  end

  def guess(guessed_letter)
    if @secret_word.split('').include?(guessed_letter)
      @found_letters.each_with_index do |_letter, index|
        @found_letters[index] = guessed_letter if guessed_letter == @secret_word.split('')[index]
      end
    else
      @mistake_count += 1
      @incorrect_letters << guessed_letter
    end
  end
end
