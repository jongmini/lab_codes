class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
  	category = params.require(:category).permit(:name)
  	Category.create(category)
  	redirect_to categories_path
  end

  def destroy
  	id = params[:id]
  	cat = Category.find(id)
  	cat.destroy

  	redirect_to categories_path

  end

  def edit
  end

  def show
  	id = params[:id]
  	@category = Category.find(id)
  	@products = @category.products
  end
end
