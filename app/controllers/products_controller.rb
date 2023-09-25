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

  def add_to_cart
    @product = Product.find(params[:id])
    @user = current_user.id
      # If the product is not in the cart, create a new cart item
      current_user.cart_items.create(product: @product)
      
      redirect_to @product, notice: 'Product added to cart.'
  end

  
  def update
    @product = Product.find(params[:id])
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

  def cart_params
    params.requires(:product).permit(:product_id)
  end

end
