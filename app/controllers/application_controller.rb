class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate!

  helper_method :logged_in?
  helper_method :current_user

private
  def authenticate!
    unless current_user
      cookies[:path] = request.path
      redirect_to login_path, alert: 'You need to login!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
