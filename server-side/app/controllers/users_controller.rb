class UsersController < ApplicationController

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(email: params[:user][:email], password: params[:user][:password])
    if @new_user.save
      # redirect_to login_path
      render json: @new_user
    else
      @error = "Your username or password is invalid"
      render json: @new_user.errors.full_messages
    end
  end
end
