class SurveysController < ApplicationController
	before_action :authenticate_user!
	# before_action :already_taken? , only: :show
	before_action :correct_user?, only: [:edit, :stats, :update, :destroy]

	def stats
		@survey = Survey.find(params[:id])
	end

	def index
		@survey = Survey.last(20)
	end

	def show
		@survey = Survey.find(params[:id])
	end

	def update
		@survey = Survey.find(params[:id])
		@survey.update_attributes(survey_params)
		redirect_to survey_path(@survey), :notice => "Survey updated"
	end

	def edit
		@survey = Survey.find(params[:id])
		@questions = Question.where(survey_id: @survey.id)
		@question = Question.new
		@choice = Choice.new
	end

	def destroy
		survey = Survey.find(params[:id])
		survey.destroy 
		redirect_to root_path, :notice => "Survey deleted"
	end

	def create
		survey = current_user.surveys.build(survey_params)
		survey.save
		redirect_to edit_survey_path(survey), :notice => "Created survey"
	end

	def new
		@survey = Survey.new
	end

	private

	def already_taken?
		survey = Survey.find(params[:id])
		unless Completion.where(user_id: current_user.id, survey_id: survey.id).count == 0 and current_user != survey.user
			redirect_to root_path, :alert => "You already took that survey"
		end
	end

	def survey_params
    params.require(:survey).permit(:title, :description)
  end

  def correct_user?
  	survey = Survey.find(params[:id])
  	user = User.find(survey.user.id)
  	redirect_to root_path unless user == current_user
  end
end