require 'rails_helper'

RSpec.describe "admin/products/edit", type: :view do
  let(:product) {
    Product.create!(
      uuid: "MyString",
      brand: "MyString",
      model: "MyString",
      description: "MyString",
      standalone_price: "9.99",
      image: "MyString",
      year: 1,
      enabled: false,
      stock_available: false,
      customizable: false,
      category: nil
    )
  }

  before(:each) do
    assign(:product, product)
  end

  xit "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(product), "post" do
      assert_select "input[name=?]", "product[uuid]"

      assert_select "input[name=?]", "product[brand]"

      assert_select "input[name=?]", "product[model]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[standalone_price]"

      assert_select "input[name=?]", "product[image]"

      assert_select "input[name=?]", "product[year]"

      assert_select "input[name=?]", "product[enabled]"

      assert_select "input[name=?]", "product[stock_available]"

      assert_select "input[name=?]", "product[customizable]"

      assert_select "input[name=?]", "product[category_id]"
    end
  end
end
