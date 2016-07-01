class CartsController < ApplicationController
  before_action :set_cart
  
  def show

  end
  
  def checkout
    @cart = nil
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end
end
