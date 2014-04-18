class Admin::AdminsController < Admin::ApplicationController
  before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @admin = Admin.new  
  end

  def edit
  end

  def create
    admin = Admin.new admin_params
    if admin.save
      flash[:success] = "You finished signup!"
      redirect_to admin_admin_url admin
    else
      flash[:error] = "You can't create this accout!"
      flash[:success] = params
      redirect_to new_admin_admin_url
    end    
  end

  def update    
    if @admin.update_attributes admin_params
      flash[:success] = "Profile updated"
      redirect_to admin_admin_url @admin
    else
      flash[:error] = "input error"
      render 'edit'
    end
  end

  def destroy
    if current_admin? @admin
      flash[:error] = "You can't delete your account"
    else
      @admin.destroy
      flash[:success] = "Admin: #{@admin.name} destroyed."      
    end
    redirect_to admin_admins_url
  end

  private

    def load_object
      @admin = Admin.find params[:id]  
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end