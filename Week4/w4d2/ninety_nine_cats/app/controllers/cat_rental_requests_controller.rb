class CatRentalRequestsController < ApplicationController

  def index
    @cat_rental_requests = CatRentalRequest.all

    render :index
  end

  def show
    @cat_rental_request = selected_cat_rental_request
    if @cat_rental_request
      render :show
    else
      render json: @cat_rental_request.errors.full_message, status: 400
    end
  end

  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      render json: @cat_rental_request.errors.full_message, status: 400
    end
  end

  def edit
    @cat_rental_request = selected_cat_rental_request
    render :edit
  end

  def update
    @cat_rental_request = selected_cat_rental_request
    if @cat_rental_request.update_attributes(cat_rental_request_params)
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      render :edit
    end
  end


  private

  def selected_cat_rental_request
    CatRentalRequest.find_by(id: params[:id])
  end

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end





end
