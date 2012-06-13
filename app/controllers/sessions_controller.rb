class SessionsController < ApplicationController
   respond_to :json

   def create
      @user = User.authenticate(params[:email], params[:password])

      if @user
        create_user_session(@user)
        render :json => {:user => UserSerializer.new(@user).as_json[:user], :api_key => @user.api_key}
      else
        respond_with "invalid email or password"
      end
   end


   def destroy
      destroy_user_session
   end

end