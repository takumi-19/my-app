Rails.application.routes.draw do
  devise_for :supporters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'stadia#index'

  resources :stadia, only: [:index, :show]

  resources :teams, only: [:index, :show] do
    resources :players, only: [:index]
  end

  resources :matches, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :rooms, only: [:index, :new, :create] do
    resources :comments, only: [:index, :create]

    namespace :api do
      resources :comments, only: :index, defaults: { format: 'json' }
    end
  end

  resources :supporters, only: [:index, :show, :edit, :update]

end
