class ProductsController < ApplicationController

  def index
    filter = Product.where("name LIKE ?", "%#{params[:filter]}%")
    @pagy, @products = pagy(filter.all, items:10)
  end

  def new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    @duplicate = Product.find_by(name: product_params[:name])
    if @duplicate #existing product found
      @duplicate.stock += @product.stock
      @duplicate.save
      redirect_to @duplicate
    else
      respond_to do |format|
        if @product.save
          format.turbo_stream do
            render turbo_stream: turbo_stream.append("products", partial: 'product', locals: {product: @product} )
          end

          # redirect_to @product
        else
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @user = current_user.id
      # If the product is not in the cart, create a new cart item
      @cartitem = current_user.cart_items.new(cart_params)
      if @cartitem.save
        redirect_to '/'
      else
        render :new, status: :unprocessable_entity
      end
      # redirect_to '/product/new', notice: 'Product added to cart.'
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
    params.require(:product).permit(:name, :description, :price, :stock)
  end

  def cart_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

end
