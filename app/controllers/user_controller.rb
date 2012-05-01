class UserController < ApplicationController
   respond_to :json

   def create
      @user = User.new(params[:user])

      if @user.save
        respond_with @user
      else
        respond_with "could not create user", :status => 401
      end
   end

end