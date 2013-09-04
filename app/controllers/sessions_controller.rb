class SessionsController < ApplicationController
	def new
    @user = User.new()
  end

  def create
    email = params[:user][:email]

    if email_exists?(email)
      @user = User.find_by(email: email)

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        #redirect_to new_user_timecapsule_url(@user)
        # redirect_to chats_url

      else
        flash.now[:alert] = "Invalid Password. Please try again..."
        render :new
      end
    else
      redirect_to login_path, alert: "Invalid Email. Please try again..."
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

