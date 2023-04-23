# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found. Example:
# > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# > substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

# Next, make sure your method can handle multiple words:
# > substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (string, dictionary)
  # convert string to array
  # iterate array and push to a new array all items that match the dictionary array
  string.downcase!
  string_array = string.split
  match_array = []
  count_array = []

  # if substring from dictionary is in "string" push it to match_array
  # count the number of times each dictionary substring occurs in string and push to count_array. remove zeros
  dictionary.each do |i|
    if string_array.any? { |str| str.include?(i) }
      match_array.push(i)
    end
    count = string_array.count { |str| str.include?(i) }
    count_array.push(count)
    count_array.delete(0)
  end

  # hash made from two equal length arrays (match_array and count_array) where one is the key and the other is the value
  puts result = match_array.zip(count_array).to_h
end


substrings("below", dictionary)
