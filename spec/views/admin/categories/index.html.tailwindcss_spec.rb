require 'rails_helper'

RSpec.describe "admin/categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        name: "Name 1",
        description: "Description 2",
        order: 1,
        parent: nil
      ),
      Category.create!(
        name: "Name 2",
        description: "Description 2",
        order: 2,
        parent: nil
      )
    ])
  end

  xit "renders a list of categories" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name 1"), count: 1
    assert_select cell_selector, text: Regexp.new("Description 1"), count: 1
    assert_select cell_selector, text: Regexp.new(1.to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Name 2"), count: 1
    assert_select cell_selector, text: Regexp.new("Description 2"), count: 1
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
