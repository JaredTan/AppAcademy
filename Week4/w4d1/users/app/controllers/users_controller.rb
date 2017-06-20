class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @user = selected_user
    if selected_user
      render json: @user
    else
      render(
        json:["THIS IS NOT ACCEPTABLE!!!!"], status: :not_acceptable
      )
    end
  end

  def update
    @user = selected_user
    if @user.update(user_params)
      render json: @user
    else
      render(
        json: ["THIS IS STILL NOT ACCEPTABLE!!! :C"], status: :unprocessable_entity
      )
    end
  end

  def destroy
    @user = selected_user
    if @user.destroy
      render json: @user
    else
      render(
        json: ["you cannot delete what you cannot find..?"], status: :unprocessable_entity
      )
    end

  end



  private

  def selected_user
    User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
