require 'csv'
files = [
  "tweets/tweets_aa",
  "tweets/tweets_ab",
  "tweets/tweets_ac"
]

results = Hash.new(0)

files.each do |f|
  IO.foreach(f) do |x| 
    borough, message = x.split("\t")
    if message.downcase.include?("knicks")
      results[borough] += 1
    end
  end
end
p results