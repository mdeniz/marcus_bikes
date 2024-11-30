require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
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
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
