Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root 'home#index'

  resources :home, only: [:index] do
    collection do
      get :recipies
    end
  end
end
