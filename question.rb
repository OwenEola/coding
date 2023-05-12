class Question 

  attr_reader :category,
              :type,
              :difficulty,
              :question,
              :correct_answer,
              :incorrect_answers
  
  def initialize(
      category:,
      type:,
      difficulty:,
      question:,
      correct_answer:,
      incorrect_answers:
  )
    @category = category
    @type = type
    @difficulty = difficulty
    @question = question
    @correct_answer = correct_answer
    @incorrect_answers = incorrect_answers
  end 

  def all_answers
    # Combing both sets of answers using 'concate'
    @all_answers ||= (@incorrect_answers + [@correct_answer]).shuffle
  end
  
  def ask
    puts "Question: #{@question}"
    puts #just adding blank space
    # Had to sneak this in here otherwise it repeats in front of every answer
    puts "Select an answer: "
    all_answers.each do |answer|
      puts "#{answer}"
    end
    puts
    puts "What is your answer: "
    response = gets.chomp
    response == @correct_answer
  end  

end
