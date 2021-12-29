def substrings (string, dictionary)
  string
end

## single word
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
input = "below"
output = { "below" => 1, "low" => 1 }
puts substrings(input, dictionary) == output

## multiple words
input = "Howdy partner, sit down! How's it going?"
output = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
puts substrings(input, dictionary) == output
