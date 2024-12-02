class CartController < ApplicationController
  layout "shop", only: :show

  before_action :set_menu, :set_cart
  before_action :set_empty_breadcrumbs, only: :show

  def show
    @cart_items = @cart.cart_items
    @subtotal = @cart.cart_items.sum(:price)
    @vat_percentage = 0.21
    @vat = @subtotal * @vat_percentage
    @discount_percentage = 0.1
    @discount = - @subtotal * @discount_percentage
    @total = @subtotal + @vat + @discount
  end

  def add_item
    product = Product.find_by!(uuid: product_params[:uuid])

    customizable_attributes = []
    product_params[:customizable_attributes_attributes]&.each_pair do |_, ca|
      customizable_attributes << { customizable_attributes_id: ca[:id], attribute_option_id: ca[:option] }
    end

    customizable_parts = []

    customization = {
      customizable_attributes: customizable_attributes,
      customizable_parts: customizable_parts
    }
    price = product.base_price

    @cart.cart_items.create(product:, quantity: 1, price:, customization:)
    # flash[:notice] = "Product added to your Cart"
    redirect_to cart_path
  end

  def update_item
  end

  def delete_item
  end

  private

    # Calculate the categories in the menu
    def set_menu
      @menu = Category.where(parent: nil).order(:order)
    end

    def set_cart
      # session[:cart_id] ||= Cart.create
      @cart = Cart.first # Just to show a preloaded cart
    end

    def set_empty_breadcrumbs
      @breadcrums = []
    end

    def product_params
      params.require(:product).permit(:authenticity_token, :uuid, customizable_attributes_attributes: [ [ :option, :id ] ])
    end
end
