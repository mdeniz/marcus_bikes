require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        uuid: "Uuid",
        brand: "Brand",
        model: "Model",
        description: "Description",
        standalone_price: "9.99",
        image: "Image",
        year: 2,
        enabled: false,
        stock_available: false,
        customizable: false,
        category: nil
      ),
      Product.create!(
        uuid: "Uuid",
        brand: "Brand",
        model: "Model",
        description: "Description",
        standalone_price: "9.99",
        image: "Image",
        year: 2,
        enabled: false,
        stock_available: false,
        customizable: false,
        category: nil
      )
    ])
  end

  xit "renders a list of products" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Uuid".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Brand".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Model".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
