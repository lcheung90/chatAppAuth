class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_username(params[:session][:username].downcase)
		if @user && @user.authenticate(params[:session][:password])
			reset_session
			session[:username] = @user.username
			flash[:notice] = "Successfully Logged in"
			redirect_to user_url(params[:session][:username])
		else
			flash.now[:notice] = "Please provide valid credentials"
			render :new
		end
    #session[:username] = params[:username]
  #render :text => "Welcome #{session[:username]}!"
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully Logged out"
    redirect_to root_url
  end
end
