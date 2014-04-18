class UsersController < ApplicationController

  before_action :load_object, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new  
  end

  def edit
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

  def update
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:error] = "input error"
      render 'edit'
    end
  end

  private

    def load_object
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end