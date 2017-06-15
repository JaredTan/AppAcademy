# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
user1 = User.create(user_name: "momo")
user2 = User.create(user_name: "bobo")
user3 = User.create(user_name: "coco")

Poll.delete_all

poll1 = Poll.create(title: "Basketball", user_id: user1.id)
poll2 = Poll.create(title: "Golf", user_id: user2.id)
poll3 = Poll.create(title: "Soccer", user_id: user3.id)

Question.delete_all

question1 = Question.create(q_text: "Did Lebron Travel?", poll_id: poll1.id)
question2 = Question.create(q_text: "Did Kobe Travel?", poll_id: poll1.id)
question3 = Question.create(q_text: "Did Steph Travel?", poll_id: poll1.id)
question4 = Question.create(q_text: "Did Phil make the put?", poll_id: poll2.id)
question5 = Question.create(q_text: "Did Tiger make the put?", poll_id: poll2.id)
question6 = Question.create(q_text: "Did Rory make the put?", poll_id: poll2.id)
question7 = Question.create(q_text: "Did Messi score?", poll_id: poll3.id)
question8 = Question.create(q_text: "Did Ronaldo score?", poll_id: poll3.id)
question9 = Question.create(q_text: "Did Pele score?", poll_id: poll3.id)

AnswerChoice.delete_all

answer1 = AnswerChoice.create(a_text: "Yes", question_id: question1.id)
answer2 = AnswerChoice.create(a_text: "No", question_id: question1.id)
answer3 = AnswerChoice.create(a_text: "Yes", question_id: question2.id)
answer4 = AnswerChoice.create(a_text: "No", question_id: question2.id)
answer5 = AnswerChoice.create(a_text: "Yes", question_id: question3.id)
answer6 = AnswerChoice.create(a_text: "No", question_id: question3.id)
answer7 = AnswerChoice.create(a_text: "Yes", question_id: question4.id)
answer8 = AnswerChoice.create(a_text: "No", question_id: question4.id)
answer9 = AnswerChoice.create(a_text: "Yes", question_id: question5.id)
answer10 = AnswerChoice.create(a_text: "No", question_id: question5.id)
answer11 = AnswerChoice.create(a_text: "Yes", question_id: question6.id)
answer12 = AnswerChoice.create(a_text: "No", question_id: question6.id)
answer13 = AnswerChoice.create(a_text: "Yes", question_id: question7.id)
answer14 = AnswerChoice.create(a_text: "No", question_id: question7.id)
answer15 = AnswerChoice.create(a_text: "Yes", question_id: question8.id)
answer16 = AnswerChoice.create(a_text: "No", question_id: question8.id)
answer17 = AnswerChoice.create(a_text: "Yes", question_id: question9.id)
answer18 = AnswerChoice.create(a_text: "No", question_id: question9.id)

Response.delete_all
response1 = Response.create(user_id: user1.id, answer_id: answer1.id)
response2 = Response.create(user_id: user2.id, answer_id: answer4.id)
response3 = Response.create(user_id: user3.id, answer_id: answer7.id)
response4 = Response.create(user_id: user1.id, answer_id: answer11.id)
response5 = Response.create(user_id: user2.id, answer_id: answer17.id)
