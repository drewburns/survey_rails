class QuestionsController < ApplicationController
	def create
		survey = Survey.find(params[:survey_id])
		@question = survey.questions.build()
		@question.save
		respond_to do |format|
	    format.js {render layout: false, content_type: 'text/javascript', :locals => {:question => @question, :choice => Choice.new} }
  	end
	end

	def update
		question = Question.find(params[:id])
		question.update_attributes(question_params)
	end

	def destroy
		question = Question.find(params[:id])
		question_id = question.id.to_s
		question.destroy
		respond_to do |format|
	    format.js {render layout: false, content_type: 'text/javascript', :locals => {:question_id => question_id} }
  	end
	end

	private

	def question_params
    params.require(:question).permit(:text, :question_type)
  end
end
