class LinksController < ApplicationController
  before_action :require_logged_in

  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def index
    @links = Link.all
    render :index
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])
    if current_user.id == @link.user_id
      if @link.update_attributes(link_params)
        redirect_to link_url(@link)
      else
        flash.now[:errors] = @link.errors.full_messages
        render :edit
      end
    else
      render :edit
    end
  end



  private



  def link_params
    params.require(:link).permit(:title, :url)
  end
end
