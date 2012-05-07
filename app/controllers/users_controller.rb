class UsersController < ApplicationController
   respond_to :json

   def create
      @user = User.new(params[:user])

      if @user.save
        render :json => @user
      else
        render :json => "could not create user", :status => 401
      end
   end

end