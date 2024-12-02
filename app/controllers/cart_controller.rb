class CartController < ApplicationController
  before_action :set_cart

  def add_item
    pp product_params.to_h
    product = Product.find_by!(uuid: product_params[:uuid])
    price = product.base_price
    # params[:customizable_attributes_attributes].each do ||
    # end
    @cart.cart_items.create(product:, quantity: 1, price: )
    flash[:notice] = "Product added to your Cart"
    redirect_to cart_path
  end

  def update_item
  end

  def delete_item
  end

  private

    def set_cart
      # @cart = Cart.find(session[:cart_id])
      @cart = Cart.first
    end

    def product_params
      params.require(:product).permit(:authenticity_token, :uuid, customizable_attributes_attributes: [ [:option, :id] ])
    end
end
