require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
    login_user

    let(:valid_attributes) {
        { :name => "Test name", :category => "Test type", :ingredients => "Test ingredients", :instructions => "Test instructions", :rating => 1}
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Recipe.create! valid_attributes
            get :index, params: {}, session: valid_session

            # Make sure to swap this as well
            expect(response).to have_http_status(:ok) # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

    describe "DELETE /destroy" do
        it "destroys the requested recipe" do
          recipe = Recipe.create! valid_attributes
          expect {
            delete recipe_url(recipe)
          }.to change(Recipe, :count).by(-1)
        end
    end
end

