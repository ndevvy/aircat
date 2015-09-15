class CatsController < ApplicationController

  def index
    @cats = Cat.all

    render :index
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_url
    else
      render(
        text: @cat.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      render :show
    else
      render(
        text: @cat.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end


  private
 def cat_params
   params.require(:cat).permit(:name, :sex, :birth_date, :color, :description)
 end

end
