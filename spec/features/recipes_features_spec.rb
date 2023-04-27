require 'rails_helper'


RSpec.feature "Recipes", type: :feature do


  context "Login" do
    scenario "should sign up" do
      visit root_path
      click_link 'Sign up'
      within("form") do
        fill_in "Email", with: "testing@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
      end
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end


    scenario "should log in" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content("Logged in")
    end
  end




  context "Create new project" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit new_recipe_path
    end


    scenario "should be successful" do
      fill_in "Name", with: "Test name"
      fill_in "Category", with: "Test category"
      fill_in "Ingredients", with: "Test ingredients"
      fill_in "Instructions", with: "Test instructions"
      fill_in "Rating", with: 1
      click_button "Create Recipe"
      expect(page).to have_content("Recipe was successfully created")
    end
 
    scenario "should fail" do
        fill_in "Name", with: "Test name"
        fill_in "Category", with: "Test category"
        fill_in "Ingredients", with: "Test ingredients"
        fill_in "Instructions", with: "Test instructions"
      click_button "Create Recipe"
      expect(page).to have_content("Rating can't be blank")
    end

    scenario "should fail" do
        fill_in "Name", with: "Test name"
        fill_in "Category", with: "Test category"
        fill_in "Ingredients", with: "Test ingredients"
        fill_in "Rating", with: 1
      click_button "Create Recipe"
      expect(page).to have_content("Instructions can't be blank")
    end

    scenario "should fail" do
        fill_in "Name", with: "Test name"
        fill_in "Category", with: "Test category"
        fill_in "Instructions", with: "Test instructions"
        fill_in "Rating", with: 1
      click_button "Create Recipe"
      expect(page).to have_content("Ingredients can't be blank")
    end

    scenario "should fail" do
      fill_in "Name", with: "Test name"
      fill_in "Ingredients", with: "Test ingredients"
      fill_in "Instructions", with: "Test instructions"
      fill_in "Rating", with: 1
      click_button "Create Recipe"
      expect(page).to have_content("Category can't be blank")
    end

    scenario "should fail" do
      fill_in "Category", with: "Test category"
      fill_in "Ingredients", with: "Test ingredients"
      fill_in "Instructions", with: "Test instructions"
      fill_in "Rating", with: 1
      click_button "Create Recipe"
      expect(page).to have_content("Name can't be blank")
    end
  end


  context "Update recipe" do
    let(:recipe) { Recipe.create(name: "Test name", category: "Test category", ingredients: "Test ingredients", instructions: "Test instructions", rating: 1) }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit edit_recipe_path(recipe)
    end


    scenario "should be successful" do
      within("form") do
        fill_in "Name", with: "New name"
      end
      click_button "Update Recipe"
      expect(page).to have_content("Recipe was successfully updated")
    end


    scenario "should fail" do
      within("form") do
        fill_in "Name", with: ""
      end
      click_button "Update Recipe"
      expect(page).to have_content("Name can't be blank")
    end

    scenario "should fail" do
        within("form") do
          fill_in "Name", with: ""
        end
        click_button "Update Recipe"
        expect(page).to have_content("Name can't be blank")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Category", with: ""
      end
      click_button "Update Recipe"
      expect(page).to have_content("Category can't be blank")
    end
    scenario "should fail" do
        within("form") do
          fill_in "Ingredients", with: ""
        end
        click_button "Update Recipe"
        expect(page).to have_content("Ingredients can't be blank")
      end    
      scenario "should fail" do
        within("form") do
          fill_in "Instructions", with: ""
        end
        click_button "Update Recipe"
        expect(page).to have_content("Instructions can't be blank")
      end
      scenario "should fail" do
        within("form") do
          fill_in "Rating", with: ""
        end
        click_button "Update Recipe"
        expect(page).to have_content("Rating can't be blank")
      end
  end

    context "Delete project" do
      let(:recipe) { Recipe.create(name: "Test name", category: "Test category", ingredients: "Test ingredients", instructions: "Test instructions", rating: 1) }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
      end

     scenario "should be successful" do       
      click_link 'Destroy'
      click_button "Ok"
      expect(page).to have_content("Recipe was successfully destroyed.")
    end
  end
end
