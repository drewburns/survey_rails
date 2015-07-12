# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Survey.create(user_id: 1, title: 'first survey', description: 'nothing')

Question.create(text: "question", question_type: "dropdown", survey_id: 1) 

Choice.create(text: 'choice', question_id: 1)

Completion.create(user_id: 1, survey_id: 1)

Selection.create(choice_id: 1 , question_id: 1, completion_id: 1)