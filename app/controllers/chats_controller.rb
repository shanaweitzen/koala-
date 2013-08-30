class ChatsController < ApplicationController
	

	def index
		@messages = Message.all
	end


	def message
		@messages = Message.new
	end

	

end