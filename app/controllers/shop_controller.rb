class ShopController < ApplicationController
  before_action :set_menu

  def homepage
    @breadcrums = []
    @products = Product.order("RANDOM()").limit(8)
  end

  def catalog
    if params[:category].present?
      category = Category.find(params[:category])
      @breadcrums = category.self_and_ancestors.reverse
      category_ids = category.self_and_descendants.map(&:id)
      @products = Product.where(category: category_ids)
    else
      @breadcrums = []
      @products = Product.all
    end
  end

  def product
    @product = Product.find(params[:id])
    @breadcrums = @product.category.self_and_ancestors.reverse
  end

  private

    # Calculate the categories in the menu
    def set_menu
      @menu = Category.where(parent: nil).order(:order)
    end
end
