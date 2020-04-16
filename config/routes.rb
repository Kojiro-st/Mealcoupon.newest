Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'messages#index'
  resources :posts do
    collection do
      get 'search'
      get 'map'
    end
  end
  resources :users, only: :show
  resources :messages, only: :index
end
