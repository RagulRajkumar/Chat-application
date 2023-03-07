Rails.application.routes.draw do
  devise_for :users
  get '/profile'=>'users#profile'
  resources :users do
    member do
      get :chat
      # get :profile
    end
  end
  root to: "users#index"
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
