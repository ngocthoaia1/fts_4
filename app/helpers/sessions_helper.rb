module SessionsHelper

  def sign_in(user)
    user.update_attributes(remember_token: SecureRandom.urlsafe_base64)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user= user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user = User.find_by_remember_token cookies[:remember_token]
  end

  def signed_in?
    current_user.present?
  end

  def sign_out
    cookies.delete :remember_token
    self.current_user = nil
  end

  def current_user?(user)
    current_user == user
  end
end