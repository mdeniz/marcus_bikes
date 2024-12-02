class ShopController < ApplicationController
  include Pagy::Backend

  before_action :set_menu, :set_cart
  before_action :set_empty_breadcrumbs, only: :homepage

  def homepage
    @products = Product.in_catalog.order("RANDOM()").limit(8)
    @customizable_product = Product.in_catalog.find_by!(customizable: true).uuid
  end

  def catalog
    if params[:category].present?
      category = Category.find(params[:category])
      category_ids = category.self_and_descendants.map(&:id)
      @breadcrums = category.self_and_ancestors.reverse
      @pagy, @products = pagy(Product.in_catalog.where(category: category_ids))
    else
      @breadcrums = [ FactoryBot.build(:category, name: "All") ]
      @pagy, @products = pagy(Product.in_catalog)
    end
  end

  def product
    @product = Product.in_catalog.includes(:selectable_products, :attribute_options).find_by!(uuid: params[:uuid])
    @breadcrums = @product.category.self_and_ancestors.reverse
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
end
