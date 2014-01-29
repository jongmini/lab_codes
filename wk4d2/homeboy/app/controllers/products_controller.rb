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
  	@all_category_names = Category.all.map {|cat| [cat.name]}
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

  def disconnect
  	cat_id = params[:cat_id]
  	prod_id = params[:id]

  	product = Product.find(prod_id)
  	category = Category.find(cat_id)

  	product.categories.destroy(category)

  	redirect_to product_path

  	# Category.find(id).products.find(@product.id)
	end



  def show
  	id = params[:id]
  	@product = Product.find(id)
  	@categories = @product.categories
  end
end
