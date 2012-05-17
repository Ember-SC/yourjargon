class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  def require_user
     return if current_user

     respond_with "unauthorized", :status => :unauthorized
  end

  def current_user
     return @current_user if @current_user

     if session[:api_key]
       @current_user = User.find_by_api_key(session[:api_key])
     end
  end

  def create_user_session(user)
    session[:api_key] = user.api_key
  end

  def destroy_user_session
    session[:api_key] = nil
  end

end
