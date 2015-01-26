class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_logged_in?

private

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end

  def user_logged_in?
    current_user.present?
  end

  def ensure_user
    user_logged_in? || redirect_to(new_token_path)
  end
end
