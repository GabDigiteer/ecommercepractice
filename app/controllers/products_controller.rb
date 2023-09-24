class ProductsController < ApplicationController

  def index
    @products = pagy(Product.all)
  end

  def new
    @product = Product.new
    @pagy, @products = pagy(Product.all)
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    @product = Product.find(params[:id])
    debugger
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
