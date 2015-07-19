class CompletionsController < ApplicationController
	def create
		if signed_in?
			completion = current_user.completions.build(completion_params)
			completion.save
		else
			completion = Completion.create(completion_params)
		end
		make_selections(completion.id,params[:question])
		redirect_to root_path
	end

	private

	def completion_params
		params.require(:completion).permit(:survey_id)
	end
end
