module Admin::SessionsHelper

  def admin_sign_in admin
    admin.update_attributes(remember_token: SecureRandom.urlsafe_base64)
    cookies.permanent[:remember_token] = admin.remember_token
    self.current_admin= admin
  end

  def current_admin=(admin)
    @current_admin = admin
  end

  def current_admin
    @current_admin = Admin.find_by_remember_token cookies[:remember_token]
  end

  def admin_signed_in?
    current_admin.present?
  end

  def admin_sign_out
    cookies.delete :remember_token
    self.current_admin = nil
  end

  def current_admin?(admin)
    current_admin == admin
  end
end