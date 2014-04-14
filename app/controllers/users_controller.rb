class UsersController < ApplicationController

  def new
    @user = User.new  
  end

  def show
    @user = User.find params[:id]
  end

  def create
    user = User.new user_params
    if user.save
      flash[:success] = "You finished signup!"
      sign_in user
      redirect_to user
    else
      flash[:error] = "You can't create this accout!"
      render 'new'
    end    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end