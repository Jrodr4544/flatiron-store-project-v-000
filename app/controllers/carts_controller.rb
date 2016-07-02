class CartsController < ApplicationController
  before_action :set_cart
  
  def show
    if current_user.current_cart
      @items = current_user.current_cart.items
      erb :'carts/show'
    else
      redirect_to 'categories/show'
    end
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
