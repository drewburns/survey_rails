class ChoicesController < ApplicationController
	def create
		
		@choice = Choice.create(choice_params)
		respond_to do |format|
	    format.js {render layout: false, content_type: 'text/javascript', :locals => {:choice => @choice} }
  	end
	end

	def destroy
		choice = Choice.find(params[:id])
		choice_id = choice.id.to_s
		choice.destroy
		respond_to do |format|
	    format.js {render layout: false, :template => 'choices/destroy.js.erb', :locals => {:choice_id => choice_id} }
  	end
	end

	def new 
		@choice = Choice.new(question_id: params[:question_id])
		respond_to do |format|
	    format.js {render layout: false, content_type: 'text/javascript', :locals => {:choice => @choice, :question => params[:question_id]} }
  	end
	end

	def update
		@choice = Choice.find(params[:id])
		@choice.update_attributes(choice_params)
		respond_to do |format|
	    format.js {render :file => "/choices/update.js.erb" , content_type: 'text/javascript', :locals => {:choice => @choice} }
  	end
	end

	private

	def choice_params
    params.require(:choice).permit(:text, :question_id)
  end
end
