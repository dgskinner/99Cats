class CatsController < ApplicationController
  
  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
    render :show
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
      flash.now[:notice] = @cat.errors.full_messages
      render :new
    end
  end
  
  private
  def cat_params
    params[:cat].permit(:sex, :birth_date, :color, :name, :description)
  end
end
