Rails.application.routes.draw do
  # get 'messages/index'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'messages#index'
  resources :posts do
    collection do
      get 'search'
      get 'map'
      get 'tag'
      get 'find'
    end
      resources :messages, only: [:index, :new, :create, :show]
  end
  resources :users, only: :show
end