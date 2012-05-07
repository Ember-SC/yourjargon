class SessionsController < ApplicationController

   def create
      @user = User.authenticate(params[:email], params[:password])

      if @user
        create_user_session(@user)
        render :json => @user
      else
        respond_with "invalid email or password"
      end
   end


   def destroy
      destroy_user_session
   end

end