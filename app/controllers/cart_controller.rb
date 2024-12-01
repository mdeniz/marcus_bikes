class CartController < ApplicationController
  before_action :set_cart

  def add_item
  end

  def update_item
  end

  def delete_item
  end

  private

    def set_cart
      @cart = Cart.find(session[:cart_id])
    end
end
