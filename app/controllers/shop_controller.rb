class ShopController < ApplicationController
  before_action :set_menu

  def homepage
    @breadcrums = []
    @products = Product.order("RANDOM()").limit(8)
  end

  def catalog
    @breadcrums = []
    if params[:category].present?
      category_ids = Category.find(params[:category]).self_and_descendants.map(&:id)
      @products = Product.where(category: category_ids)
    else
      @products = Product.all
    end
  end

  def product
    @breadcrums = []
  end

  private

    # Calculate the categories in the menu
    def set_menu
      @menu = Category.where(parent: nil).order(:order)
    end
end
