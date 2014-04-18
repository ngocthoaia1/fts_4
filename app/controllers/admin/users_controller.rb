class Admin::UsersController < Admin::ApplicationController
  before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @user = User.new  
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to admin_users_url
    else
      flash[:error] = "input error"
      render 'edit'
    end
  end

  def destroy    
    @user.destroy
    flash[:success] = "User: #{@user.name} destroyed."
    redirect_to admin_users_url
  end

  private

    def load_object
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end