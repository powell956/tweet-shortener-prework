require 'pry'

def dictionary
  shorter = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end


def word_substituter(tweet)
  words = tweet.split(' ')
  # binding.pry
  subs = dictionary
  i = 0

  words.each do |word|
    if subs.keys.any? { |word_to_replace| word }
      subs.each do |to_sub, sub_with|
        if word.downcase == to_sub
          words.delete_at(i)
          words.insert(i, sub_with)
        end
      end
    end
  i += 1
  end
  words = words.join(' ')
  # binding.pry
end

def bulk_tweet_shortener(tweets)
  tweets.map! { |tweet| word_substituter(tweet) }
  tweets.each { |tweet| puts tweet }
  tweets
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if word_substituter(tweet).length > 140
    word_substituter(tweet)[0..136] + '...'
  else
    tweet
  end
end
