Rails.application.routes.draw do
  devise_for :users

  resources :profiles do
    resources :achievements
    resources :support_groups, only: [:index, :new, :create, :destroy]
  end

  resources :friendships, only: [:index, :create, :destroy]


  root 'profiles#index'
end
