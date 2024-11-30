require 'rails_helper'

RSpec.describe "admin/products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      uuid: "MyString",
      brand: "MyString",
      model: "MyString",
      description: "MyString",
      base_price: "9.99",
      image: "MyString",
      year: 1,
      enabled: false,
      stock_available: false,
      customizable: false,
      category: nil
    ))
  end

  xit "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input[name=?]", "product[uuid]"

      assert_select "input[name=?]", "product[brand]"

      assert_select "input[name=?]", "product[model]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[base_price]"

      assert_select "input[name=?]", "product[image]"

      assert_select "input[name=?]", "product[year]"

      assert_select "input[name=?]", "product[enabled]"

      assert_select "input[name=?]", "product[stock_available]"

      assert_select "input[name=?]", "product[customizable]"

      assert_select "input[name=?]", "product[category_id]"
    end
  end
end
