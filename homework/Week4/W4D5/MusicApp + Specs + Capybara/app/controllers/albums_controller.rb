class AlbumsController < ApplicationController
  before_action :require_logged_in

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = 'You successfully added an album!'
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by_name(params[:name])
    if @album.update_attributes
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find_by_name(params[:name])
    if @album
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      redirect_to albums_url
    end
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end
end
