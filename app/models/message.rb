class Message < ActiveRecord::Base
	belongs_to :user

	def text_with_user_name
		'<span class="user_name">'+ self.user.first_name + '</span>' + ": " + self.text  
	end
end
