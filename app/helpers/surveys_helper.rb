module SurveysHelper
	def get_data(question)
		data = []
		question.choices.each do |choice|
			data << [choice.text, (choice.selections.count)/(question.selections.count).to_f * 100]
		end
		data
	end
end
