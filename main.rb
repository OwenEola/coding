require './question'
require './question_maker'
require './game'
require './database_connection'

questions = QuestionMaker.new.create_questions

Game.new(questions).play
