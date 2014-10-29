class CatRentalRequestsController < ApplicationController
  
  def new
    @cat_rental_request = CatRentalRequest.new(cat_id: flash[:cat_id])
    @cats = Cat.all
    render :new
  end
  
  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    
    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat)
    else
      @cats = Cat.all
      flash[:notice] = @cat_rental_request.errors.full_messages
      render :new
    end
  end
  
  def approve
    @cat_rental_request = CatRentalRequest.find(params[:id])
    
    if @cat_rental_request.approve!
      redirect_to cat_url(@cat_rental_request.cat)
    else
      flash[:notice] = ["This request CANNOT be approved"]
      redirect_to cat_url(@cat_rental_request.cat)    
    end
  end
  
  def deny
    @request = CatRentalRequest.find(params[:id])
    @request.deny!
    redirect_to cat_url(@request.cat)
  end
  
  
  private
  def cat_rental_request_params
    params[:cat_rental_request].permit(:cat_id, :start_date, :end_date)
  end
end
