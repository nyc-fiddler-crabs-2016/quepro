user_amount           = 1
survey_amount         = 40
questions_per_survey  = 3

surveys_taken_amount  = 30
choices_per_question  = 4

responses_per_choice  = 5


# USERS
user_amount.times do
  User.create(  user_name:        Faker::Internet.user_name,
                password:        'pw'
                )
end
User.create(user_name: "will", password: "pw")

# User.create(username: 'joe', password: 'pw')

user_ids = User.all.map { |user| user.id }




# Surveys
survey_amount.times do

  survey = Survey.create(title:     Faker::Hipster.sentence(2),
                         user_id:   user_ids.sample)

   questions_per_survey.times do
    question = Question.create(name:       Faker::Hipster.sentence(3),
                               survey_id:  survey.id)

      choices_per_question.times do
       choice = Choice.create(name:        Faker::Hipster.sentence,
                               question_id: question.id  )

       rand(responses_per_choice).times do
        Response.create(user_id: user_ids.sample,
                        choice_id: choice.id,
                        question_id: question.id)
       end

    end

  end

end

survey_ids = Survey.all.map { |survey| survey.id }

surveys_taken_amount.times do
  SurveysTaken.create(user_id: user_ids.sample,
                      survey_id: survey_ids.sample)
end




