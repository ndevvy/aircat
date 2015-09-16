class CatRentalRequestsController < ApplicationController

  def create
    @request = CatRentalRequest.new(request_params)
    if @request.save
      redirect_to cats_url
    else
      render(
        text: @request.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def show
  end

  def approve
    @request = CatRentalRequest.find(params[:id])
    @request.approve!
    redirect_to cats_url
  end

  def deny
    @request = CatRentalRequest.find(params[:id])
    @request.deny!
    redirect_to cats_url
  end

private

  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end

end
