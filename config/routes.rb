Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
