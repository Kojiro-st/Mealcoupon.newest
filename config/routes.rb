Rails.application.routes.draw do
  # get 'messages/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'messages#index'
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :messages, only: :index
end
