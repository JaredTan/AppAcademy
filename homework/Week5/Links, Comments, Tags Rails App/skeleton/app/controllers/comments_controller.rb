class CommentsController < ApplicationController
  before_action :require_logged_in

  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to link_url(@comment.link_id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_url(@comment.link_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :link_id)
  end
end
