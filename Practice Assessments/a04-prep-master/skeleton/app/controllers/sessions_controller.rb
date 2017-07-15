class SessionsController < ApplicationController

  def new

  end


  def create
    @user = User.find_by_credentials(
      params[user][username],
      params[user][password]
    )
    if @user
      login!(@user)
      redirect_to links_url
    else
      flash.now[:errors] = errors.full_messages
      render :new
    end
  end


end
