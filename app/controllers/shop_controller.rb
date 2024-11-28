class ShopController < ApplicationController
  before_action :set_menu

  def homepage
    @breadcrums = []
    @products = Product.order("RANDOM()").limit(4)
  end

  def catalog
    @breadcrums = []
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
