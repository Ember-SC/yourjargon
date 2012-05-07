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

     if session[:user_id]
       @current_user = User.find_by_id(session[:user_id])
     end
  end

  def create_user_session(user)
    session[:user_id] = user.id
  end

  def destroy_user_session
    session[:user_id] = nil
  end

end
