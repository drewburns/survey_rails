class ChoicesController < ApplicationController
	def create
		question = Question.find(params[:question_id])
		choice = question.choices.build(choice_params)
	end

	def destroy
		Choice.find(params[:id]).destroy
	end

	private

	def choice_params
    params.require(:choice).permit(:text)
  end
end
