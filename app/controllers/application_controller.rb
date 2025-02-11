class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  helper_method :current_user, :logged_in? # Make these available in views

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  # Example: Require login for certain actions
  # before_action :require_login, only: [:profile, :other_protected_actions]

  private

  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "You must be logged in to access this page."
    end
  end
end