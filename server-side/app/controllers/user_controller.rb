class UserController < ApplicationController
  after_filter :cors_set_access_control_headers

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(email: params[:email], password: params[:password])
    if @new_user.save
      # redirect_to login_path
      render json: @new_user
    else
      @error = "Please make sure your passwords match"
      render json: @new_user.errors.full_messages
    end
  end

  private
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

end
