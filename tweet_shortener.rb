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
        if word == to_sub
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
  tweets.map { |tweet| word_substituter(tweet) }
  # binding.pry
end

tweet_one = "Hey guys, can anyone teach me how to be cool? I really want to be the best at everything, you know what I mean? Tweeting is super fun you guys!!!!"
tweet_two = "OMG you guys, you won't believe how sweet my kitten is. My kitten is like super cuddly and too cute to be believed right?"
tweet_three = "GUISEEEEE this is so fun! I'm tweeting for you guys and this tweet is SOOOO long it's gonna be way more than you would think twitter can handle, so shorten it up you know what I mean? I just can never tell how long to keep typing!"
tweet_four = "New game. Middle aged tweet followed by #youngPeopleHashTag Example: Gotta get my colonoscopy and mammogram soon. Prevention is key! #swag"
tweet_five = "I'm running out of example tweets for you guys, which is weird, because I'm a writer and this is just writing and I tweet all day. For real, you guys. For real."
tweets = [tweet_one, tweet_two, tweet_three, tweet_four, tweet_five]
bulk_tweet_shortener(tweets)
#
#
# def hamburger(toppings)
#   i = 0
#   toppings = toppings.each do |topping|
#     placeholder = topping
#     toppings.delete_at(i)
#     toppings.insert(i, "I love #{placeholder} on my burgers!")
#     i += 1
#   end
#   toppings
# end
