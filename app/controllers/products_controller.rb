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
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.append("errormsg", 'Create product failed')
          end
        end
      end
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @user = current_user.id
      @cartitem = current_user.cart_items.new(cart_params)
      respond_to do |format|
        if @cartitem.save
          format.turbo_stream do
            render turbo_stream: "Added to cart succesfully"
          end
        else
          render :new, status: :unprocessable_entity
        end
      end
  end

  
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("products", partial: 'product', locals: {product: @product} )
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@product) }
      end
    end

    # redirect_to root_path, status: :see_other
  end

  

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock)
  end

  def cart_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end


end
