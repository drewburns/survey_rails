module ApplicationHelper
	def give_title(title)
		site = "Survey Rails"
		if title.empty?
			site
		else
			"#{title} | #{site}"
		end
	end
	 def custom_flash
    flash_messages = []
    flash.each do |type, message|
      type = type.to_sym
      toastr_type = :success if type == :notice
      toastr_type = :error   if type == :alert
      toastr_type = :error   if type == :error
      toastr_type = :error   if type == :warning
      toastr_type = :info   if type == :info

      text = %Q[<script>toastr.#{toastr_type}("#{message}");</script>]
      flash_messages << text.html_safe if message and toastr_type
    end
    flash_messages.join("\n").html_safe
  end
end
