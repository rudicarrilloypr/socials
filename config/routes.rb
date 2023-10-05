Rails.application.routes.draw do
  root 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:create]
    member do
      post 'like', to: 'likes#create'
      delete 'unlike', to: 'likes#destroy'
    end
  end
end
