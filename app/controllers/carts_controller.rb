class CartsController < ApplicationController
  before_action :set_cart
  
  def show

  end

  def checkout
    @cart.checkout
    redirect_to cart_path(current_user)
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end
end
