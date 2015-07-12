class QuestionsController < ApplicationController
	def create
		survey = Survey.find(params[:id])
		question = survey.questions.build(question_params)
		question.save
	end

	def update
		question = Question.find(params[:id])
		question.update_attributes(question_params)
	end

	def destroy
		Question.find(params[:id]).destroy
	end

	private

	def question_params
    params.require(:question).permit(:text, :question_type)
  end
end
