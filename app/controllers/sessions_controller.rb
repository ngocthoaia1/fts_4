class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      user.password = params[:session][:password]
      user.password_confirmation = params[:session][:password]
      sign_in user
      flash[:success] = "Sign in successfully"      
      redirect_to user
    else
      flash.now[:error] = "email or password is incorrect"
      render 'new'
    end   
  end

  def destroy
    sign_out
    redirect_to signin_url
  end
end