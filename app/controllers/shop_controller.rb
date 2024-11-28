class ShopController < ApplicationController
  before_action :set_menu

  def homepage
    @breadcrums = []
    @products = Product.in_catalog.order("RANDOM()").limit(8)
  end

  def catalog
    if params[:category].present?
      category = Category.find(params[:category])
      category_ids = category.self_and_descendants.map(&:id)
      @breadcrums = category.self_and_ancestors.reverse
      @products = Product.in_catalog.where(category: category_ids)
    else
      @breadcrums = [ FactoryBot.build(:category, name: "All") ]
      @products = Product.in_catalog
    end
  end

  def product
    @product = Product.in_catalog.find_by!(uuid: params[:uuid])
    @breadcrums = @product.category.self_and_ancestors.reverse
  end

  private

    # Calculate the categories in the menu
    def set_menu
      @menu = Category.where(parent: nil).order(:order)
    end
end
