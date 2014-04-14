class Admin::SessionsController < Admin::ApplicationController

  def new
  end

  def create
    admin = Admin.find_by_email params[:session][:email].downcase
    if admin && admin.authenticate(params[:session][:password])
      admin_sign_in admin
      flash[:success] = "Sign in successfully"      
      redirect_to admin_root_url
    else
      flash.now[:error] = "email or password is incorrect"
      render 'new'
    end   
  end

  def destroy
    admin_sign_out
    redirect_to admin_signin_url
  end
end