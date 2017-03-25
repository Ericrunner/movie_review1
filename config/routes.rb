Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reviews do
    member do
      post :join
      post :quit
    end
    resources :posts
  end
  root 'reviews#index'
end
