class CartController < ApplicationController
  before_action :set_cart

  def add_item
    product = Product.find_by!(uuid: product_params[:uuid])

    customizable_attributes = []
    product_params[:customizable_attributes_attributes].each_pair do |_, ca|
      customizable_attributes << {customizable_attributes_id: ca[:id], attribute_option_id: ca[:option]}
    end

    customizable_parts = []
    customization = {
      customizable_attributes: customizable_attributes,
      customizable_parts: customizable_parts
    }

    price = product.base_price

    @cart.cart_items.create(product:, quantity: 1, price:, customization:)
    #flash[:notice] = "Product added to your Cart"
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
