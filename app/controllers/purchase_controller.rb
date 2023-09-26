class PurchaseController < ApplicationController

    def index
        @user = current_user.id
        @purchase = Purchase.where(user_id: @user)
    end
end
