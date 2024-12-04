class CartController < ApplicationController
  layout "shop", only: :show

  before_action :set_menu, :set_cart, only: [ :show, :add_item ]
  before_action :set_cart_item, only: [ :delete_item, :update_item ]
  before_action :set_empty_breadcrumbs, only: :show

  def show
    @cart_items = @cart.cart_items
    @subtotal = @cart.cart_items.sum { |item| item.quantity * item.price }
    @vat_percentage = 0.21
    @vat = @subtotal * @vat_percentage
    @discount_percentage = 0.1
    @discount = - @subtotal * @discount_percentage
    @total = @subtotal + @vat + @discount
  end

  def add_item
    product = Product.find_by!(uuid: product_params[:uuid])

    selected_attribute_option_ids = []
    selected_part_option_ids = []

    customizable_attributes = []
    product_params[:customizable_attributes_attributes]&.each_pair do |_, ca|
      customizable_attributes << {
        customizable_attribute_id: ca[:id],
        attribute_option_id: ca[:option]
      }

      # Attributes options in the customization of the main product
      selected_attribute_option_ids << ca[:option]
    end

    customizable_parts = []
    product_params[:customizable_parts_attributes]&.each_pair do |_, cp|
      customization_str = cp[:customization].empty? ? "[]" : cp[:customization]
      customization = JSON.parse(customization_str)

      customizable_parts << {
        customizable_part_id: cp[:id],
        attribute_option_id: cp[:option],
        customizable_attributes: customization
      }
      # Part options in the customization of the main product
      selected_part_option_ids << cp[:option]

      # Attributes options in the customization of the parts
      customization&.each do |ca|
        selected_attribute_option_ids << ca[:option]
      end
    end

    customization = {
      customizable_attributes: customizable_attributes,
      customizable_parts: customizable_parts
    }

    price = product.price(selected_attribute_option_ids:, selected_part_option_ids:)

    @cart.cart_items.create(product:, quantity: 1, price:, customization:)
    # flash[:notice] = "Product added to your Cart"
    redirect_to cart_path
  end

  def update_item
    @cart_item.update(quantity: params[:cart_item][:quantity])
    redirect_to cart_path
  end

  def delete_item
    @cart_item.destroy
    redirect_to cart_path
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

    def set_cart_item
      params.permit(:authenticity_token, :id, :_method, :cart_item)
      @cart_item = CartItem.find(params[:id])
    end

    def set_empty_breadcrumbs
      @breadcrumbs = []
    end

    def product_params
      params.require(:product).permit(:authenticity_token, :uuid, customizable_attributes_attributes: [ [ :option, :id ] ], customizable_parts_attributes: [ [ :option, :id, :customization ] ])
    end
end
