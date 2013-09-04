class SessionsController < ApplicationController
	def new
    @user = User.new()
  end

  def create
    email = params[:user][:email]

      if @user = User.authenticate(email, params[:user][:password]) 

        session[:user_id] = @user.id
        
        redirect_to chats_url

      else
        flash.now[:alert] = "Invalid Credentials. Please try again..."
        redirect_to root_url  
      end
   
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You've successfully logged out."
  end

  private

  def email_exists?(email)
    User.where(email: email).exists?
  end

end

