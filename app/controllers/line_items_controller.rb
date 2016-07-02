class LineItemsController < ApplicationController

  def create
    if current_user.current_cart.blank?
      current_user.create_cart
    end
    current_user.current_cart.add_item(params[:item_id].to_i).save
    redirect_to cart_path(current_user.current_cart)
  end

end
