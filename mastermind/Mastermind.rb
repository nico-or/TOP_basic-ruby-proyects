module Mastermind
  MOVES = ('0'..'5').to_a
  MOVES_LEN = 4

  def self.is_valid_secret_code? string
    string.chars.uniq.length == MOVES_LEN
  end

  def self.is_valid_code_guess? string
    return false unless string.length == MOVES_LEN
    return false unless string.chars.all? { |i| MOVES.include? i }
    true
  end
end
