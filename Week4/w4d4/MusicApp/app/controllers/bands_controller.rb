class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = 'You successfully added an band!'
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find_by_name(params[:name])
    if @band.update_attributes
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def show
    @band = Band.find_by_name(params[:name])
    if @band
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
