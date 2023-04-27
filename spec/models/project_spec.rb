require "rails_helper"

describe "Recipe Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the name is present when creating Recipe" do
      recipe = Recipe.new(category: "category", ingredients: "Ingredients", instructions: "Instructions", rating: 1)
      expect(recipe.valid?).to eq(false)
    end
    it "should not be able to save Recipe when name missing" do
      recipe = Recipe.new(category: "category", ingredients: "Ingredients", instructions: "Instructions", rating: 1)
      expect(recipe.save).to eq(false)
    end
    it "should be able to save Recipe when have description and title" do
      recipe = Recipe.new(name: "name", category: "category", ingredients: "Ingredients", instructions: "Instructions", rating: 1)
      expect(recipe.save).to eq(true)
    end
  end
end

describe "Recipe Attribute Requirements on Edit", :type => :model do
  context "Edit Recipe" do  
    before (:each) do
      @recipe = Recipe.create(name: "name", category: "category", ingredients: "Ingredients", instructions: "Instructions", rating: 1)
  
      end
    it "ensures the name is present when editing Recipe" do
      @recipe.update(:name => "New name")
      expect(@recipe.name == "New name")
    end
  end
end

