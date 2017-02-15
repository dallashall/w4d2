class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    redirect_to action: :index unless @cat
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    redirect_to action: :index unless @cat
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def cat_params
    params.require(:cat).permit(:birth_date, :name, :color, :sex, :description)
  end
end
