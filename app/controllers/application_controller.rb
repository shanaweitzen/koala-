class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    # @current_user ||= User.find('520c7fb78c63ab1b48000001')
  end

  helper_method :current_user
  
  def is_authenticated
    redirect_to root_url unless current_user
  end
end