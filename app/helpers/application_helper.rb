module ApplicationHelper
	def give_title(title)
		site = "Survey Rails"
		if title.empty?
			site
		else
			"#{title} | #{site}"
		end
	end
end
