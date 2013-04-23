class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
        reset_session
        session[:user_id] = @user.id
        flash[:notice] = "User successfully created"
        redirect_to user_url(@user.username)
    else
        render action: "new"
    end
  end

  def show
    @user = User.find_by_username(params[:id])
  end
end
