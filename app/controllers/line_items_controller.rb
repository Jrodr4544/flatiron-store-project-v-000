class LineItemsController < ApplicationController

  def create
    @cart = current_user.current_cart
    # line_item = LineItem.find(params[:item_id].to_i)
    if @cart
      @cart.add_item(params[:item_id].to_i).save
      
      redirect_to cart_path(@cart)
    else
      current_cart.current_cart = Cart.create(user_id: current_user.id)
      current_cart.current_cart.add_item(params[:item_id].to_i).save
      redirect_to cart_path(@cart)
    end
  end

end
