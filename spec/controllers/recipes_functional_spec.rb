require "rails_helper"


RSpec.describe RecipesController, :type => :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end


        context "GET #show" do
            let!(:recipe) { Recipe.create(name: "name", category: "category", ingredients: "ingredients", instructions: "instructions", rating: 1) }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
    end
end
