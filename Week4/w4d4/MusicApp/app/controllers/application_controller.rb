class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user

  private

  def login!(user)
    session[:session_token] = user.session_token
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logout!
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def require_logged_in
    redirect_to bands_url unless current_user
  end

  def require_logged_out
    redirect_to new_session_url if current_user
  end

end
