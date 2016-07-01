class LineItemsController < ApplicationController

  def create
    # line_item = LineItem.find(params[:item_id].to_i)
    if current_user.current_cart
      current_user.current_cart.add_item(params[:item_id].to_i).save

      redirect_to cart_path(current_user.current_cart)
    else
      current_user.current_cart = Cart.create(user_id: current_user.id)
      current_user.current_cart.add_item(params[:item_id].to_i).save
      
      redirect_to cart_path(current_user.current_cart)
    end
  end

end
