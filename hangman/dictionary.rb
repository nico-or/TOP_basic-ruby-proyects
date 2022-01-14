class Dictionary
  attr_reader :words

  def initialize(filename = '5desk.txt')
    @words = File.open(filename, 'r').readlines.map { |i| i.chomp.downcase }
  end

  def get_word
    words_in_range.sample
  end

  private

  def words_in_range(min = 5, max = 12)
    @words.filter { |i| i.length.between?(min, max) }
  end
end
