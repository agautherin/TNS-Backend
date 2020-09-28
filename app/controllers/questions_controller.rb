class QuestionsController < ApplicationController

    def getquestions
        question = ''
        finalArr = [] 
        questions = Question.all.sample(25)

        questions.each do |q|
            choices = []
            correct = ''
            incorrect = []
            
            # byebug
            

            choices = Choice.where(question_id: q.id)
            # byebug
            choices.each do |c|
                if c.iscorrect === true
                    correct = c.choice_text
                elsif c.iscorrect === false
                    incorrect.push(c.choice_text)
                end
            end
            
            

            finalArr.push(question = [ 
                'question' => q.question, 
                'choices' => {
                    'correct' => correct,
                    'incorrect' => incorrect
                }
            ])
            
            
        end
        
        render json: {question: finalArr} 
    end
end
