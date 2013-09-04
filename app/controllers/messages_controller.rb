class MessagesController < ApplicationController

	def create
		@message = Message.new(message_params)
		if @message.save!
			Pusher.trigger('messages', "new_message", @message) #trigger message channel channel, evnt, data
			redirect_to chats_url
		end
	end

	private

	def message_params
		params.require(:message).permit(:text)
	end
end