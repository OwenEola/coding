# Use Ruby's Net::HTTP class to fetch data from a questions api
# Use this as the source of your data
# https://opentdb.com/api.php?amount=15&type=multiple

# Pass the results of the HTTP GET to your JSON.parse method
# See if you can make it to the end of your game!

require 'net/http'
require 'uri' 
require 'JSON'

class QuestionMaker
  def input_json
    url = URI('https://opentdb.com/api.php?amount=15&type=multiple')
    data = Net::HTTP.get(url)
    JSON.parse(data)
  end

  def create_questions
    input_json['results'].map do |result|
      Question.new(
      category: result['category'],
      type: result['type'],
      difficulty: result['difficulty'],
      question: result['question'],
      correct_answer: result['correct_answer'],
      incorrect_answers: result['incorrect_answers']
      )
    end
  end
end
