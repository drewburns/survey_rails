class QuestionsController < ApplicationController

	def create
		@question = Question.create(question_params)
		respond_to do |format|
	    format.js {render layout: false, content_type: 'text/javascript', :locals => {:question => @question, :choice => Choice.new} }
  	end
	end

	def new
		@question = Question.new(survey_id: params[:survey_id])
		respond_to do |format|
	    format.js {render layout: false, content_type: 'text/javascript', :locals => {:question => @question, :choice => Choice.new} }
  	end
	end

	def update
		puts "__________"
		puts question_params
		@question = Question.find(params[:id])
		@question.update_attributes(question_params)
		respond_to do |format|
	    format.js {render :file => "/questions/update.js.erb" , content_type: 'text/javascript', :locals => {:question => @question, :choice => Choice.new} }
  	end
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
    params.require(:question).permit(:text, :question_type, :survey_id)
  end
end
