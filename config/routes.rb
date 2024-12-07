Rails.application.routes.draw do
  get 'moods/new'
  get 'moods/create'
  get 'moods/edit'
  get 'moods/update'
  get 'moods/destroy'
  devise_for :users

  resources :profiles do
    resources :achievements, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :support_groups, only: [:index, :new, :create, :destroy]
    resources :moods, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  resources :friendships, only: [:index, :create, :destroy]


  root 'profiles#index'
end
