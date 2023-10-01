class CartController < ApplicationController
    def index
        @user = current_user.id
        @cartitems = current_user.cart_items
    end

    def new
      @user = current_user.id
      @cartitems = current_user.cart_items.where(checkedout: false)
      @finalprice = 0;
      total = 0;
      
      # @cartitems.each do |c|
      #   total = c.product.price * c.quantity
      #   @finalprice += total;
      # end

      

  end

  #Checkout
  def create
    @user = current_user.id
    @cartitems = CartItem.where(user_id: @user, checkedout: false)
    @cartitems.each do |c|
      Purchase.create(user_id: @user, product_id: c.product_id)
      c.update(checkedout: true)
      #add subtraction of stock
      # stockupdate = stock - c.quantity
      # Product.find(c.product_id).update_attribute(:stock, )
    end
    #need to add validation

    redirect_to new_cart_path, notice: 'Items purchased'

  end

end
