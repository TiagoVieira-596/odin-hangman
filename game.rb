class Game
  attr_reader :secret_word, :hangmanpics

  def initialize
    words = File.open('google-10000-english-no-swears.txt', 'r')
    @secret_word = words.filter { |word| word.length >= 6 && word.length <= 13 }
    @hangmanpics = File.read('hangmanpics.txt').split(',')
    @mistake_count = 0
  end

  def self.guess(guessed_letter)
    if @secret_word.split('').include?(guessed_letter)
      @correct_letters << guessed_letter
    else
      @mistake_count += 1
      @wrong_letters << guessed_letter
    end
  end
end
