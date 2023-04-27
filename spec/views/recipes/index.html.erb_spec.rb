require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        name: "Name",
        category: "Category",
        ingredients: "MyText",
        instructions: "MyText",
        rating: 2
      ),
      Recipe.create!(
        name: "Name",
        category: "Category",
        ingredients: "MyText",
        instructions: "MyText",
        rating: 2
      )
    ])
  end

  it "renders a list of recipes" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 4
    assert_select "tr>td", text: "MyText".to_s, count: 4
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
