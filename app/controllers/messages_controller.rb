class MessagesController < ApplicationController

	def create
		puts "\n\n HERE \n\n"
		@message = Message.new(message_params)
		if @message.save!
			# i need a response back in JSON so I know it saved in the DB
			Pusher.trigger('messages', "new_message", @message.text_with_user_name) #trigger message channel channel, evnt, data
			puts "\n\n here \n\n"
			render :json => "", :code => :ok
		end
	end

	private

	def message_params
		params.require(:message).permit(:text, :user_id)
	end
end