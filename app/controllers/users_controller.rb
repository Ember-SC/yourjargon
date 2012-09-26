class UsersController < ApplicationController
   respond_to :json

   def create
      @user = User.new(params[:user])

      if @user.save
        render :json => {:user => UserSerializer.new(@user).as_json[:user], :api_key => @user.api_key}
      else
        render :json => "could not create user", :status => 401
      end
   end

   def show
     if User.exists?(api_key: params[:id])
       @user = User.where(api_key: params[:id]).first
     else
       @user = User.find(params[:id])
     end

     if @user
       render :json => @user
     else
       render :json => "User not found", :status => 404
     end
   end

end