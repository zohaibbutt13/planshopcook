Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root 'home#index'

  resources :home, only: [:index]

  resources :meal_plans, only: [:new, :create]
  resources :recipes, only: [:new, :create, :index] do
    member do
      get :add_to_favorite
    end
    collection do
      get :favorite_recipes
    end
  end
end
