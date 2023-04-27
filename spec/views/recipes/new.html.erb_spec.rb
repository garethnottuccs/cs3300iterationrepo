require 'rails_helper'

RSpec.describe "recipes/new", type: :view do
  before(:each) do
    assign(:recipe, Recipe.new(
      name: "MyString",
      category: "MyString",
      ingredients: "MyText",
      instructions: "MyText",
      rating: 1
    ))
  end

  it "renders new recipe form" do
    render

    assert_select "form[action=?][method=?]", recipes_path, "post" do

      assert_select "input[name=?]", "recipe[name]"

      assert_select "input[name=?]", "recipe[category]"

      assert_select "textarea[name=?]", "recipe[ingredients]"

      assert_select "textarea[name=?]", "recipe[instructions]"

      assert_select "input[name=?]", "recipe[rating]"
    end
  end
end
