Rails.application.routes.draw do


  ActiveAdmin.routes(self)

     resources :users do
      resources :messages, only: [ :new, :create]

  end



  resources :agencies do
    collection do
      get "compare", to: "agencies#compare"
      post "compare", to: "agencies#compare"
      get 'search', to: "agencies#search"
      post 'search', to: "agencies#search"

    end






    resources :reviews, only: [:new, :create]
    resources :references, only: [:new, :create]
    resources :quotes, only: [:new, :create]
    resources :wishlists, only: [:index, :new, :create]


  end

#  require "sidekiq/web"
#  authenticate :user, lambda { |u| u.admin } do
#    mount Sidekiq::Web => '/sidekiq'
#  end

  devise_for :users



  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
