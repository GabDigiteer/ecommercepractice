class CartController < ApplicationController
    def index
        @user = current_user.id
        @cartitems = current_user.cart_items
    end

    def new
      @user = current_user.id
      @cartitems = current_user.cart_items
      @finalprice = 0;
      total = 0;
      
      # @cartitems.each do |c|
      #   total = c.product.price * c.quantity
      #   @finalprice += total;
      # end

      

  end

    def create
      @user = current_user.id
      @cartitems = CartItem.where(user_id: @user)
      @cartitems.each do |c|
        Purchase.create(user_id: @user, product_id: c.product_id)
      end
      #need to add validation
      redirect_to new_cart_path, notice: 'Orders created successfully.'

    end

end
