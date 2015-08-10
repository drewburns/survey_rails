require 'test_helper'
require 'rails/performance_test_help'

class SurveysTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }


  def setup 
  	@survey = surveys(:dog_survey)
  	@user = users(:andrew)
  	@question = questions(:number)
  	@params = {"utf8"=>"✓", "authenticity_token"=>"lIriGXOR+TBJYJJqj8wjiIuwZ3/c+g1ohPYy5Sp+O6BjmzEXF7Qp0rK/KB8nvvTOqE7rjlXykWaisAGo4VgDWg==", "completion"=>{"survey_id"=>"1"}, "question"=>{"1"=>"1"}, "commit"=>"Submit Choices"}
{"utf8"=>"✓", "authenticity_token"=>"lIriGXOR+TBJYJJqj8wjiIuwZ3/c+g1ohPYy5Sp+O6BjmzEXF7Qp0rK/KB8nvvTOqE7rjlXykWaisAGo4VgDWg==", "completion"=>{"survey_id"=>"1"}, "question"=>{"1"=>"1"}, "commit"=>"Submit Choices", "controller"=>"completions", "action"=>"create"}
  end


  test "index" do
  	get surveys_path
  end

  test "show" do
  	# sign_in :andrew
    get survey_path(@survey)
  end

  test "submit survey" do
  	150.times do
    	get survey_path(@survey)
  		post completions_path(@params)		
  	end
  end
end
