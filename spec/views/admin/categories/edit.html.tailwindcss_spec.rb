require 'rails_helper'

RSpec.describe "admin/categories/edit", type: :view do
  let(:category) {
    Category.create!(
      name: "MyString",
      description: "MyString",
      order: 1,
      parent: nil
    )
  }

  before(:each) do
    assign(:category, category)
  end

  xit "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(category), "post" do
      assert_select "input[name=?]", "category[name]"

      assert_select "input[name=?]", "category[description]"

      assert_select "input[name=?]", "category[order]"

      assert_select "input[name=?]", "category[parent_id]"
    end
  end
end
