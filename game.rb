class Game
  def initialize
    words = File.read('google-10000-english-no-swears')
    @secret_word = words.filter { |word| word.length >= 5 && word.length <= 12 }.sample
  end
end
