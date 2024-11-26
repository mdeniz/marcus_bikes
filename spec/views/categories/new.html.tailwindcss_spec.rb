require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      name: "MyString",
      description: "MyString",
      order: 1,
      category: nil
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do
      assert_select "input[name=?]", "category[name]"

      assert_select "input[name=?]", "category[description]"

      assert_select "input[name=?]", "category[order]"

      assert_select "input[name=?]", "category[category_id]"
    end
  end
end
