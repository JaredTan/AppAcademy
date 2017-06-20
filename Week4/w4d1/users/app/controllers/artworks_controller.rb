class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artwork_params)
    # replace the `artwork_attributes_here` with the actual attribute keys
    if @artwork.save
      render json: @artwork
    else
      render(
        json: @artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @artwork = selected_artwork
    if selected_artwork
      render json: @artwork
    else
      render(
        json:["THIS IS NOT ACCEPTABLE!!!!"], status: :not_acceptable
      )
    end
  end

  def update
    @artwork = selected_artwork
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render(
        json: ["THIS IS STILL NOT ACCEPTABLE!!! :C"], status: :unprocessable_entity
      )
    end
  end

  def destroy
    @artwork = selected_artwork
    if @artwork.destroy
      render json: @artwork
    else
      render(
        json: ["you cannot delete what you cannot find..?"], status: :unprocessable_entity
      )
    end
  end



  private

  def selected_artwork
    Artwork.find_by(id: params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
