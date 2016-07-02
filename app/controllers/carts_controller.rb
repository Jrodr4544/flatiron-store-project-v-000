class CartsController < ApplicationController
  
  def show
    # binding.pry
    @current_cart = current_user.current_cart
  end

  def checkout
    current_user.current_cart.checkout
    current_user.current_cart.destroy
    redirect_to cart_path(current_user)
  end

end
