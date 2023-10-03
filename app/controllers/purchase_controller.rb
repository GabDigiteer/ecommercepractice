class PurchaseController < ApplicationController

    def index
        @user = current_user.id
        @purchase = Purchase.where(user_id: @user)
        @current_time = Time.now.utc.strftime(("%d %B %Y %H:%M:%S"))
        #date format of purchase date is on index
    end
end
