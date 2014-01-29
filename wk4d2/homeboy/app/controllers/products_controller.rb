class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	product = params.require(:product).permit(:name)
  	Product.create(product)	
  	redirect_to products_path
  end


  def edit
  	id = params[:id]
  	@product = Product.find(id)
  	@categories = @product.categories
  	@all_categories = Category.all.each
  end

  def update
  	id = params[:id]
  	cat = params[:product]["categories"]  # array[0] is nil
  	new_cat= cat.select {|c| c!= ""}
  	@product = Product.find(id)
	  	new_cat.each do |x|
	  	@product.categories << Category.find_by_name(x)
	  	end
  	redirect_to product_path

  end

  def destroy
  	id = params[:id]
  	prod = Product.find(id)
  	prod.destroy

  	redirect_to products_path

  end



  def show
  	id = params[:id]
  	@product = Product.find(id)
  	@categories = @product.categories
  end
end
