class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :validate_user
  helper_method :admin

  protected 
  def back
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def current_user
    @current_user ||= session.has_key?(:user_id) && Player.find(session[:user_id])
  end

  def validate_user(user_id)
    current_user && current_user.id == user_id
  end

  def admin
    current_user && current_user.role == 'admin'
  end

  private
  def require_login
    redirect_to new_session_path unless current_user
  end

  def require_admin
    redirect_to new_session_path unless admin
  end

  def require_permission(user_id)
    redirect_to new_session_path unless admin || validate_user(user_id)
  end
end
