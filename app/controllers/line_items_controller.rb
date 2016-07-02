class LineItemsController < ApplicationController

  def create
    current_cart = current_user.current_cart
    if current_cart.blank?
      current_cart = current_user.create_cart

      redirect_to store_path
    end

    current_cart.add_item(params[:item_id].to_i).save
    redirect_to cart_path(current_cart)
  end

end
