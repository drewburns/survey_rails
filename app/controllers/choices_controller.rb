class ChoicesController < ApplicationController
	def create
		@choice = Choice.create(choice_params)
		respond_to do |format|
	    format.js {render layout: false, content_type: 'text/javascript', :locals => {:choice => @choice} }
  	end
	end

	def destroy
		Choice.find(params[:id]).destroy
	end

	def update
		@choice = Choice.find(params[:id]).update_attributes(choice_params)
	end

	private

	def choice_params
    params.require(:choice).permit(:text, :question_id)
  end
end
