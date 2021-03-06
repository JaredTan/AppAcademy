class SessionsController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = user.find_by_credentials(
    params[:user][:username], 
    params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = 'Invalid username and/or password'
      render :new
    else
      login_user(user)
      redirect_to bands_url
    end
  end

  def destroy
    current_user.logout!
    redirect_to new_session_url
  end

end
