class CartController < ApplicationController
    def index
        @user = current_user.id
        @cartitems = CartItem.all.where(user:@user)


    end

    def purchase
      debugger  
      # @user = current_user.id
      # @cartitems = CartItem.all.where(user:@user)
      # #AFTER PURCHASE ADD ALL TO PURCHASES AND DELETE CART

      # cartitems.each do |item|
      #   current_user.purchases.create(product_id:item.id)
      # end

    end
end
