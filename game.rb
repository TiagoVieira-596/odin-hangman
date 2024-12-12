class Game
  def initialize
    words = File.open('google-10000-english-no-swears.txt', 'r')
    @secret_word = words.filter { |word| word.length >= 5 && word.length <= 12 }.sample.chomp
  end
end
