require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    range = ('A'..'Z').to_a
    @letters = 10.times.map { range.sample }
  end

  def score
    raise
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word(word)
    word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url).read
    result = JSON.parse(user_serialized)
    if result['found'] == true
      "Congratulations!#{word.uppercase} is a valid English word !"
    else
      "Sorry but #{word.uppercase} does not seem to be a valid English word..."
    end
  end
end
