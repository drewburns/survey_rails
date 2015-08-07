class CompletionsController < ApplicationController
	def create
		survey = Survey.find(completion_params[:survey_id])
		if params[:question] and survey.questions.count == params[:question].count 
			if signed_in?
				completion = current_user.completions.build(completion_params)
				completion.save
			else
				completion = Completion.create(completion_params)
			end
			make_selections(completion.id,params[:question])
			after_survey_redirect
		else
			redirect_to :back , :alert => "You need to answer all questions"
		end
	end

	private

	def completion_params
		params.require(:completion).permit(:survey_id)
	end
end
