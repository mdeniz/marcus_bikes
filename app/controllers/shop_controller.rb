class ShopController < ApplicationController
  def homepage
    @products = Product.order("RANDOM()").limit(4)
  end

  def catalog
  end

  def product
  end
end
