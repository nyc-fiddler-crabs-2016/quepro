user_amount           = 6
survey_amount         = 10
questions_per_survey  = 5

surveys_taken_amount  = 20
choices_per_question  = 4
responses_per_choice  = 2


# USERS
user_amount.times do
  User.create(  user_name:        Faker::Internet.user_name,
                password:        'pw'
                )
end

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

    end

  end

end

survey_ids = Survey.all.map { |survey| survey.id }

surveys_taken_amount.times do
  SurveysTaken.create(user_id: user_ids.sample,
                      survey_id: survey_ids.sample)
end




