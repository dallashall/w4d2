class CatRentalRequestsController < ApplicationController

  def index
    @rentals = CatRentalRequest.all
  end

  def show
    @rental = CatRentalRequest.find_by(id: params[:id])
    if @rental
      render :show
    else
      render :index
    end
  end

  def new
    
  end

  def create
    @rental = CatRentalRequest.new(rental_params)
    if @rental.save
      render cat_rental_request_url(@rental)
    else
      redirect_to :new
    end
  end

  private
  def rental_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date)
  end
end
