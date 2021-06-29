Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root 'home#index'

  resources :home, only: [:index]

  resources :meal_plans, only: [:new, :create] do
    collection do
      get :get_all_meals
    end

    member do
      get :select_meal
    end
  end

  resources :recipes, only: [:new, :create, :index, :show] do
    member do
      post   :add_to_favorite
      delete :remove_from_favorite
    end
    collection do
      get :favorite_recipes
    end
  end

  resources :ingredients, only: [:new]
end
