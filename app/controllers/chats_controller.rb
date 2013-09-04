class ChatsController < ApplicationController
	
	before_action :is_authenticated 
	
	def index
		@messages = Message.all
		@user = current_user
	end


	def message
		@messages = Message.new
	end


	

end