class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def login!(user)
    session[:session_token] = user.session_token
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def require_logged_in
    redirect_to new_session_url unless current_user
  end

  def require_logged_out
    redirect_to links_url if current_user
  end

  def logged_in?
    !!current_user
  end
end
