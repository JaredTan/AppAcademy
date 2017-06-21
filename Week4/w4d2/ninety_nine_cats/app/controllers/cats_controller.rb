class CatsController < ApplicationController

  def index
    @cats = Cat.all
    # render json: @cats
    render :index
    # render :index
  end

  def show
    @cat = selected_cat
    if @cat
      render :show
    else
      render json: @cat.errors.full_message, status: 400
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_message, status: 400
    end
  end

  def edit
    @cat = selected_cat
    render :edit
  end

  def update
    @cat = selected_cat
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  private

  def selected_cat
    Cat.find_by(id: params[:id])
  end

  def cat_params
    params["cat"]["color"] = params["cat"]["color"].downcase
    params.require(:cat).permit(:birth_date, :color, :sex, :name, :description)
  end
end
